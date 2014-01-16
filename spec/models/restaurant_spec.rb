require 'spec_helper'

describe '.average_rating' do

  let(:restaurant) { create(:restaurant) }

  context 'no ratings' do 

    it 'returns "unrated"' do 
      expect(restaurant.average_rating).to eq "unrated"
    end

  end

  context 'only one rating' do 

    it 'returns that rating' do 
      restaurant.reviews << Review.new(rating: 4)
      expect(restaurant.average_rating).to eq(4)
    end
  end

  context 'several ratings' do

    it 'returns an average' do
      restaurant.reviews << Review.new(rating: 3)
      restaurant.reviews << Review.new(rating: 1)
      expect(restaurant.average_rating).to eq(2)
    end
  end
  
end
