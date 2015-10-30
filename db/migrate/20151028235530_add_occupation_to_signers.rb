class AddOccupationToSigners < ActiveRecord::Migration
  def change
    add_column :signers, :occupation, :string
  end
end
