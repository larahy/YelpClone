require 'spec_helper'

describe '.rating' do

  let(:pret) { create(:restaurant) }

  it 'cannot be less than one' do 
    review = Review.new(rating: 0, content: 'yadda yadda', restaurant: pret)
    expect(review).not_to be_valid
  end

  context 'unpromoted restaurant' do 

    it 'can be rated up to 4 stars' do 
      review = Review.new(rating: 4, content: 'yadda yadda', restaurant: pret)
      expect(review).to be_valid
    end

    it 'can not be rated above 4 stars' do 
      review = Review.new(rating: 5, restaurant: pret)
      expect(review).not_to be_valid 
    end

  end

  context 'promoted restaurant' do

    let(:pret) { create(:restaurant, promoted: true) }

    it 'can be rated at 5 stars' do 
      review = Review.new(rating: 5, content: 'yadda yadda', restaurant: pret)
      expect(review).to be_valid
    end

  end

end




