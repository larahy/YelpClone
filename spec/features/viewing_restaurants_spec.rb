require 'spec_helper'

describe 'restaurant index' do 

  before do
    create(:restaurant)
  end

  context 'with restaurants' do 

    it 'should display restaurant names and descriptions' do 
      visit '/restaurants'
      expect(page).to have_content 'Pret'
      expect(page).to have_content 'Sandwiches'
    end 

  end 

  context 'without restaurants' do 

    it 'should display a message' do 
      visit '/restaurants'
      click_link 'Delete restaurant'
      expect(page).to have_content('No restaurants yet!')
    end 
    
  end

  context 'on individual pages' do 

    it 'should display only one restaurant' do 
      visit '/restaurants'
      click_link 'Pret'
      expect(page).to have_content 'Current reviews'
    end

  end 

end 