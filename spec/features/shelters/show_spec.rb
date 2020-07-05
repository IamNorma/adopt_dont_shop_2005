require 'rails_helper'

RSpec.describe "page for individual shelter", type: :feature do
  it "can show individual shelter name and full address info" do
    shelter_1 = Shelter.create(name: "Southeast Denver Pet Shelter",
                               address: "12345 S Parker Rd",
                               city: "Denver",
                               state: "Colorado",
                               zip: 80231)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
  end
end
