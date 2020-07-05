class ShelterPetsController < ApplicationController
 def index
   @shelter = Shelter.find(params[:shelter_id])
   @pets = @shelter.pets
   @adoptable_pets = adoptable
 end

 private
 def adoptable
   @pets.where(adoption_status: "Adoptable")
 end
end
