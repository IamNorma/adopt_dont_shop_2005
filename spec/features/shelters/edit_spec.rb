require 'rails_helper'

RSpec.describe 'edit shelter' do
  it 'can edit an individual shelter info' do
    shelter_1 = Shelter.create(name: "North Denver Pet Shel",
                               address: "12345 North Rd",
                               city: "Denver",
                               state: "Colorado",
                               zip: 80002)
    visit '/shelters'

    expect(page).to_not have_content("North Denver Pet Shelter")

    click_on "Update Shelter"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    fill_in :name, with: "North Denver Pet Shelter"
    fill_in :address, with: "12345 North Rd"
    fill_in :city, with: "Denver"
    fill_in :state, with: "Colorado"
    fill_in :zip, with: 80002

    click_on "Update Shelter"

    expect(current_path).to eq('/shelters')
    expect(page).to have_content("North Denver Pet Shelter")
  end
end
