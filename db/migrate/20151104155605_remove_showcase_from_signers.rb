class RemoveShowcaseFromSigners < ActiveRecord::Migration
  def change
    remove_column :signers, :showcase, :boolean
  end
end
