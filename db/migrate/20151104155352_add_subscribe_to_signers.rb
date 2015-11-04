class AddSubscribeToSigners < ActiveRecord::Migration
  def change
    add_column :signers, :subscribe, :boolean
  end
end
