class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :date
      t.string :publisher
      t.string :headline
      t.string :image_url
      t.string :link_text
      t.string :url

      t.timestamps null: false
    end
  end
end
