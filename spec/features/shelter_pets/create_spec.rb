require 'rails_helper'

RSpec.describe 'create a new pet' do
  it 'will create new adoptable pet when viewing the shelter pets index page' do
    shelter_2 = Shelter.create!(name: "Park Hill Pet Shelter",
                               address: "10045 N Smith Rd",
                               city: "Denver",
                               state: "Colorado",
                               zip: 80200)
    visit "/shelters/#{shelter_2.id}/pets"

    expect(page).to_not have_content("Miss Birdie")

    click_on "Create Pet"

    expect(current_path).to eq("/shelters/#{shelter_2.id}/pets/new")

    fill_in :image, with: "https://cdn.shopify.com/s/files/1/2077/4509/products/0788547b52cf1f5456d5f891ec1aa40d_grande.jpg?v=1573315028"
    fill_in :name, with: "Miss Birdie"
    fill_in :description, with: "She's a great companion. Loves to chat in the mornings."
    fill_in :age, with: "2.4 years"
    fill_in :sex, with: "Female"

    click_button "Create Pet"

    pet = Pet.last
    
    expect(current_path).to eq("/shelters/#{shelter_2.id}/pets")
    expect(page).to have_content("Miss Birdie")
  end
end
