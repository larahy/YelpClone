require 'spec_helper'

describe 'reviewing' do 

  it 'can add a review' do 
    Restaurant.create(name: "Pret", description: "Sandwiches")
    Member.create email: 'larahy@gmail.com', password: 'hugothedog'
    visit '/members/sign_in'
    fill_in 'Email', with: 'larahy@gmail.com'
    fill_in 'Password', with: 'hugothedog'
    click_button 'Sign in'
    click_button 'Pret'
    click_link 'Add review'
    select 2, from: 'Rating'
    fill_in 'Content', with: 'fresh'
    click_button 'Submit'
    expect(page).to have_content 'fresh'
  end

  
end
