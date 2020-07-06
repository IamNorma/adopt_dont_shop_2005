class ShelterPetsController < ApplicationController
 def index
   @shelter = Shelter.find(params[:shelter_id])
   @pets = @shelter.pets
   @adoptable_pets = adoptable
 end

 def new
 end

 def create
   shelter = Shelter.find(params[:id])
   pet = shelter.pets.create(pet_params)
   redirect_to "/shelters/#{shelter.id}/pets"
 end

 private
 def adoptable
   @pets.where(adoption_status: "Adoptable")
 end

 def pet_params
   params.permit(:image, :name, :description, :approximate_age, :sex, :adoption_status)
 end
end
