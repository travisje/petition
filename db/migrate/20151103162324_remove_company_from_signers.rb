class RemoveCompanyFromSigners < ActiveRecord::Migration
  def change
    remove_column :signers, :company, :string
  end
end
