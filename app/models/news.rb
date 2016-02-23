class News < ActiveRecord::Base
  def self.pull
    news = GoogleSheet.new(:news).pull_sheet
    if news
      News.destroy_all
      news.each do |story|
        News.create(story)
      end
    end
  end

end
