require 'spec_helper'

describe 'reviewing' do 

    before do 
        login
        create(:restaurant)
    end

  it 'can add a review' do 
    visit '/restaurants'
    click_link 'Pret'
    click_link 'Add review'
    select 2, from: 'Rating'
    fill_in 'Content', with: 'fresh'
    click_button 'Submit'
    expect(page).to have_content 'fresh'
  end

  
end
