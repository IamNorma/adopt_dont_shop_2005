require 'rails_helper'

RSpec.describe "Delete individual shelter" do
  it "can delete an individual shelter by clicking link" do
    shelter_1 = Shelter.create(name: "Southeast Denver Pet Shelter",
                               address: "12345 S Parker Rd",
                               city: "Denver",
                               state: "Colorado",
                               zip: 80231)
    shelter_2 = Shelter.create(name: "Park Hill Pet Shelter",
                               address: "10045 N Smith Rd",
                               city: "Denver",
                               state: "Colorado",
                               zip: 80200)
    shelter_3 = Shelter.create(name: "Montbello Pet Shelter",
                               address: "12600 Albrook Drive",
                               city: "Denver",
                               state: "Colorado",
                               zip: 80239)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content("Southeast Denver Pet Shelter")

    click_on "Delete Shelter"

    expect(current_path).to eq("/shelters")

    expect(page).to_not have_content("Southeast Denver Pet Shelter")
  end
end
