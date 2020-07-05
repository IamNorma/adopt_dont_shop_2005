require 'rails_helper'

RSpec.describe "pets index page" do
  it "shows all pets including the pets' info" do
    shelter_1 = Shelter.create!(name: "Southeast Denver Pet Shelter",
                               address: "12345 S Parker Rd",
                               city: "Denver",
                               state: "Colorado",
                               zip: 80231)
    shelter_2 = Shelter.create!(name: "Park Hill Pet Shelter",
                               address: "10045 N Smith Rd",
                               city: "Denver",
                               state: "Colorado",
                               zip: 80200)
    pet_1 = Pet.create!(image: "https://www.teacupdogdaily.com/wp-content/uploads/2016/05/Chihuahua-Splashed-markings.jpg",
                       name: "Tito",
                       description: "Tito loves kids and playing fetch with empty plastic water bottles.",
                       approximate_age: "5 years",
                       sex: "Male",
                       adoption_status: "Pending",
                       shelter_id: shelter_1.id)
    pet_2 = Pet.create!(image: "https://vetstreet.brightspotcdn.com/dims4/default/1d87d20/2147483647/thumbnail/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F3a%2Fc3%2F424ee1bf4768973966bde73acda8%2Fgerman-shepherd-AP-1S7FRX-645sm12913.jpg",
                       name: "Oso",
                       description: "Full of energy and a great cuddle buddy.",
                       approximate_age: "5 months",
                       sex: "Male",
                       adoption_status: "Pending",
                       shelter_id: shelter_1.id)
    pet_3 = Pet.create!(image: "https://pawster.com/wp-content/uploads/2017/08/yorkshire-terrier-768x432.jpg",
                       name: "Max",
                       description: "Max also goes by Maxy. He's a sweet, well-mannered boy. Keep in mind he hates UPS trucks.",
                       approximate_age: "13 years",
                       sex: "Male",
                       adoption_status: "Adoptable",
                       shelter_id: shelter_2.id)

    visit "/pets"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(shelter_1.name)
  end
end
