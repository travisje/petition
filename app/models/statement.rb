class Statement < ActiveRecord::Base

  def self.pull
    statements = GoogleSheet.new(:statements_page).pull_sheet
    if statements
      Statement.destroy_all
      statements.each do |statement|
        Statement.create(statement)
      end
    end
  end

end
