class GoogleSheet
  
  require "google/api_client"
  require "google_drive"

  attr_accessor :tab_name, :columns_key
  attr_reader :worksheet, :signer
  
  def initialize(tab_name, signer=nil)
    @signer = signer
    @tab_name = tab_name
    set_tab_columns
    begin
      session = GoogleDrive.login_with_oauth(access_token)
      @worksheet = session.spreadsheet_by_key(ENV['spreadsheet_id']).worksheets[tab_number]
    rescue => e
      if signer
        Rails.logger.error {"Google Spreadsheet Error - Initialization Error #{signer.first_name} #{signer.last_name} #{signer.id} #{e.message}"}
      else
        Rails.logger.error {"Google Spreadsheet Error - Initialization Error on Workseet pull"}
      end
      @worksheet = nil
    end
  end

  def tab_number
    tab_key = {
      master_list: 0,
      home_page_statements: 1,
      statements_page: 2,
      art_apps: 3
    }
    tab_key[tab_name]
  end

  def set_tab_columns
    if tab_name == :statements_page
      self.columns_key = {
        name: 1,
        statement: 2,
        hyperlink: 3
      }
    elsif tab_name == :art_apps
      self.columns_key = {
        category: 1,
        name: 2,
        hyperlink: 3,
        image_url: 4
      }
    end
  end


  def add_record
    if worksheet
      begin
        insert_row = first_empty_row
        worksheet[insert_row, 1] = signer.id
        worksheet[insert_row, 2] = signer.first_name
        worksheet[insert_row, 3] = signer.last_name
        worksheet[insert_row, 4] = signer.email
        worksheet[insert_row, 5] = signer.country
        worksheet[insert_row, 6] = signer.occupation
        worksheet[insert_row, 7] = signer.comment
        worksheet[insert_row, 9] = signer.subscribe
        worksheet[insert_row, 10] = signer.display_sig
        worksheet[insert_row, 11] = signer.created_at
        worksheet.save
      rescue => e
        Rails.logger.error {"Google Spreadsheet Error - Save error #{signer.first_name} #{signer.last_name} #{signer.id} #{e.message}"}
      end
    end
  end

  def pull_sheet
    if worksheet && columns_key
      current_row = 2
      result = []
      while current_row < first_empty_row
        result << {}
        columns_key.each do |column, index|
          result.last[column] = worksheet[current_row, index]
        end
        current_row += 1
      end
    end
    result
  end


  private


    def first_empty_row
      worksheet.num_rows + 1
    end

    def access_token
      # https://github.com/gimite/google-drive-ruby/issues/155
      client = Google::APIClient.new
      auth = client.authorization
      auth.client_id = ENV['g_drive_client_id']
      auth.client_secret = ENV['g_drive_secret']
      auth.scope = [
        "https://www.googleapis.com/auth/drive",
        "https://spreadsheets.google.com/feeds/"
      ]
      auth.redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
      auth.refresh_token = ENV["g_drive_refresh_token"]
      auth.fetch_access_token!
      auth.access_token
    end

end

