require 'rails_helper'

feature "Signer management" do
  scenario "adds a new signer" do
    signer = build(:signer)
    visit root_path
    click_link "THE PETITION"
    expect{
    fill_in 'First Name', with: signer.first_name
    fill_in 'Last Name', with: signer.last_name
    fill_in 'Email', with: signer.email
    page.select "France", :from => 'signer[country]'
    fill_in "Occupation (optional)", with: signer.occupation
    fill_in "I'm signing because...(optional)", with: signer.comment
    click_button 'SUBMIT'
    }.to change(Signer, :count).by(1)
    expect(current_path).to eq signers_path
    expect(page).to have_content 'THANK YOU FOR SIGNING'
    expect(page).to have_content "#{signer.first_name}"
  end

  scenario "tells signer to add a valid email if none is present and does not save signer" do
    signer = build(:signer)
    visit root_path
    click_link "THE PETITION"
    expect{
    fill_in 'First Name', with: signer.first_name
    fill_in 'Last Name', with: signer.last_name
    page.select "France", :from => 'signer[country]'
    click_button 'SUBMIT'
    }.to change(Signer, :count).by(0)
    expect(page).to have_content "Email is invalid"
  end

end