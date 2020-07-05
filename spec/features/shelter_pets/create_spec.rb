require 'rails_helper'

RSpec.describe 'create a new pet' do
  it 'will create new adoptable pet when viewing the shelter pets index page' do
    visit "/shelters/#{shelter_2.id}/pets"

    click_on "Create Pet"
  end
end
