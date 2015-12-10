class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.string :name
      t.text :statement
      t.string :hyperlink

      t.timestamps null: false
    end
  end
end
