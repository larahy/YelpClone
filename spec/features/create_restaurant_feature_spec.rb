require 'spec_helper'

describe 'creating restaurants' do

  context 'given a name and description' do

    it 'should display the new restaurant on the list of restaurants' do
      visit '/restaurants/new'
      fill_in 'Name', with: 'Pure'
      fill_in 'Description', with: "Sandwich takeaway"
      click_button 'Create Restaurant'

      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'Pure'
    end
  end

    context 'without a name and description' do 

      it 'should display errors' do 
        visit '/restaurants/new'
        click_button 'Create Restaurant'
        expect(page).to have_content 'error'
      end  
    end

end


