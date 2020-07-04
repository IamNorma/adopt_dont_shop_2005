require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters names" do
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

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content(shelter_3.name)
  end
end
