require 'spec_helper'

describe 'editing restaurants' do 
  before do
    create(:restaurant)
  end

  it 'should be possible to edit the name' do 
    visit '/restaurants'
    click_link 'Edit information'
    fill_in 'Name', with: 'Pret2'
    click_button 'submit_button'
    expect(page).to have_content 'Pret2'
  end 

  it 'should be possible to delete the restaurant' do 
    visit restaurants_url
    click_link 'Delete restaurant'
    expect(page).to have_content 'No restaurants yet!'
  end

end
