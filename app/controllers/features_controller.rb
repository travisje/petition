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

  def update_app

  end

  def update_app_now
    if params[:code] == ENV['update_app_id']
      Artapp.pull
      Statement.pull
      News.pull
      flash[:success] = "Thank you, application has been updated."
      redirect_to root_path
    else
      flash.now[:alert] = "Incorrect id, please try again."
      render 'update_app'
    end
  end
  
end
