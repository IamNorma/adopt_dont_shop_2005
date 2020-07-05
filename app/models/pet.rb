class Pet < ApplicationRecord
  validates_presence_of :image, :name, :description, :approximate_age, :sex, :adoption_status
  belongs_to :shelter
end
