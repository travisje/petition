class CreateSigners < ActiveRecord::Migration
  def change
    create_table :signers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :country
      t.string :street_address
      t.string :zip
      t.string :comment
      t.boolean :display_sig
      t.boolean :showcase
      t.timestamps null: false
    end
  end
end
