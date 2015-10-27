class GoogleSheet
  
  require "google/api_client"
  require "google_drive"

  attr_accessor :worksheet

  def initialize
    session = GoogleDrive.login_with_oauth(access_token)
    @worksheet = session.spreadsheet_by_key(ENV['spreadsheet_id']).worksheets[0]
  end

  def add_record(signer)
    insert_row = first_empty_row
    worksheet[insert_row, 1] = signer.id
    worksheet[insert_row, 2] = signer.first_name
    worksheet[insert_row, 3] = signer.last_name
    worksheet[insert_row, 4] = signer.email
    worksheet[insert_row, 5] = signer.country
    worksheet[insert_row, 6] = signer.comment
    worksheet[insert_row, 7] = signer.display_sig
    worksheet[insert_row, 8] = signer.created_at
    worksheet.save
  end

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

