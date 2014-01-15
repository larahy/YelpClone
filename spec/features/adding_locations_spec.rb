require 'spec_helper'

describe 'adding_locations' do 

  it 'can add a review' do 
    Restaurant.create(name: "Pret", description: "Sandwiches")
    visit '/restaurants'
    click_link 'Pret'
    click_link 'Add location'
    fill_in 'Name', with: 'City Road'
    fill_in 'Takeaway', with: true
    click_button 'Submit'
    expect(page).to have_content 'true'
  end
end