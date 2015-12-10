class CreateArtapps < ActiveRecord::Migration
  def change
    create_table :artapps do |t|
      t.string :name
      t.string :category
      t.string :hyperlink
      t.string :image_url

      t.timestamps null: false
    end
  end
end
