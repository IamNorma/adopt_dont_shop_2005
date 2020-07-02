require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters names" do
    shelter_1 = Shelter.create(name: "Southeast Denver Pet Shelter")
    shelter_2 = Shelter.create(name: "Park Hill Pet Shelter")
    shelter_3 = Shelter.create(name: "Montbello Pet Shelter")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content(shelter_3.name)
  end
end 
