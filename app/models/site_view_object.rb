class SiteViewObject
  
  require 'csv'
  attr_accessor :signer
  
  def initialize(signer=nil)
    @signer = signer
  end

  def active_header(params)
    if params[:controller] == "signers"
      {petition: "active-header"}
    elsif params[:controller] == "features"
      if params[:action] == "index"
        {index: "active-header"}
      elsif params[:action] == "about"
        {about: "active-header"}
      elsif params[:action] == "art_apps"
        {art_apps: "active-header"}
      end
    end
  end

  def custom_statements
    results = []
    CSV.foreach((Rails.root.join 'db','signer_statements.csv'), "r:ISO-8859-1") do |row|
      filtered_row = correct_apostrophe(row)
      results << {name: filtered_row[0], statement: filtered_row[1]}
    end
    results.drop(1)
  end

  def correct_apostrophe(row)
    row.map do |element|
      element.gsub("Õ","'")
    end
  end


end