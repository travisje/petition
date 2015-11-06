require 'rails_helper'

describe GoogleSheet do
  it "adds a signer" do
    signer = create(:signer)
      expect(signer.add_to_spreadsheet).to eq(true)
  end

end