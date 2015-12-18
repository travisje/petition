class AddFeatureToStatements < ActiveRecord::Migration
  def change
    add_column :statements, :feature, :boolean
  end
end
