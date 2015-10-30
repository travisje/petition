class RemovePositionFromSigners < ActiveRecord::Migration
  def change
    remove_column :signers, :position, :string
  end
end
