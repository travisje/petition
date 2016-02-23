class FeaturesController < ApplicationController
  
  def index
    @art_apps = Artapp.homepage_apps
    @statements = Statement.featured
    @news = News.all.order(:id)
  end

  def about

  end

  def art_apps
    @categories = Artapp.categories
  end

  def statements
    @statements = Statement.all.order(:id)
  end
  
end
