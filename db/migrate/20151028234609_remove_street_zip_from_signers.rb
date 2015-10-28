class RemoveStreetZipFromSigners < ActiveRecord::Migration
  def change
    remove_column :signers, :zip, :string
    remove_column :signers, :street_address, :string
  end
end
