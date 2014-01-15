require 'spec_helper'

describe 'creating members' do

  context 'new member sign-up' do 

    it 'should allow visitors to become members' do 
      visit '/members/sign_up' 
      fill_in 'Email', with: 'lara@lara.com'
      fill_in 'Password', with: 'basilthedog'
      fill_in 'Password confirmation', with: 'basilthedog'
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully')
    end

  end

  context 'current members' do 

    before do
    Member.create email: 'larahy@gmail.com', password: 'hugothedog'
    Restaurant.create name: 'Pret', description: 'sandwiches'
  end

    it 'should be able to sign in' do 
      visit '/members/sign_in'
      fill_in 'Email', with: 'larahy@gmail.com'
      fill_in 'Password', with: 'hugothedog'
      click_button 'Sign in'
      expect(page).to have_content('Signed in successfully.')
    end

    it 'should be able to sign out' do 
      visit '/members/sign_in'
      fill_in 'Email', with: 'larahy@gmail.com'
      fill_in 'Password', with: 'hugothedog'
      click_button 'Sign in'
      expect(page).to have_content('Signed in successfully.')
      click_link 'Sign Out'
      expect(page).to have_content('Signed out successfully.')
    end

    it 'should be able to add a review' do 
      visit '/members/sign_in'
      fill_in 'Email', with: 'larahy@gmail.com'
      fill_in 'Password', with: 'hugothedog'
      click_button 'Sign in'
      click_link 'Pret'
      click_link 'Add review'
      expect(page).to have_content('Content')
    end

  end

end

