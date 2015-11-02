class AddFeaturedToSigners < ActiveRecord::Migration
  def change
    add_column :signers, :feature, :Boolean
  end
end
