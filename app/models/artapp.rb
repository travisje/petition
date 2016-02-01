class Artapp < ActiveRecord::Base
  
  def self.pull
    art_apps = GoogleSheet.new(:art_apps).pull_sheet
    if art_apps
      Artapp.destroy_all
      art_apps.each do |app|
        Artapp.create(app)
      end
    end
  end

  def self.homepage_apps
    Artapp.where(category: "ARTS-CENTERED APPS").order(:id)
  end

  def self.apps_page
    art_apps = Artapp.where.not(category: "ARTS-CENTERED APPS").order(:id)
    art_apps.each do |app|

    end
  end

  def self.categories
    cat_array = []
    categories = Artapp.select('distinct on(category) id, category').sort #array of unique categories of Artapp objects sorted by sheet order. 
    categories.each do |category_obj|
      cat_array <<category_obj.category
    end
    cat_array.shift #remove first category which is only for homepage
    cat_array
  end

  def self.by_category(category)
    Artapp.where(category: category).order(:id)
  end


end
