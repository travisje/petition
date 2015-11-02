class AddCompanyPositionToSigners < ActiveRecord::Migration
  def change
    add_column :signers, :company, :string
    add_column :signers, :position, :string
  end
end
