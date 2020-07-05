require 'rails_helper'

RSpec.describe "page for individual pet" do
  it 'can display information for an individual pet' do
    shelter_1 = Shelter.create!(name: "Southeast Denver Pet Shelter",
                               address: "12345 S Parker Rd",
                               city: "Denver",
                               state: "Colorado",
                               zip: 80231)
    pet_1 = Pet.create!(image: "https://www.teacupdogdaily.com/wp-content/uploads/2016/05/Chihuahua-Splashed-markings.jpg",
                       name: "Tito",
                       description: "Tito loves kids and playing fetch with empty plastic water bottles.",
                       approximate_age: "5 years",
                       sex: "Male",
                       adoption_status: "Pending",
                       shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_contetn(pet_1.description)
    expect(page).to have_contetn(pet_1.approximate_age)
    expect(page).to have_contetn(pet_1.sex)
    expect(page).to have_contetn(pet_1.adoption_status)
  end
end
