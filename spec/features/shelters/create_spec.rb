require 'rails_helper'

RSpec.describe 'create a new shelter' do
  it "will create a new shelter using a link to a form on the index page" do
    visit '/shelters'

    expect(page).to_not have_content("Arvada Pet Shelter")

    click_on 'New Shelter'

    expect(current_path).to eq('/shelters/new')

    fill_in :name, with: "Arvada Pet Shelter"
    fill_in :address, with: "24444 E Evans"
    fill_in :city, with: "Arvada"
    fill_in :state, with: "Colorado"
    fill_in :zip, with: 89235

    click_on 'Create Shelter'

    expect(current_path).to eq('/shelters')
    expect(page).to have_content("Arvada Pet Shelter")
  end
end
