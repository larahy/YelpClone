require 'spec_helper'

describe '.rating' do

  it 'cannot be less than one' do 
    lyon = Restaurant.new(name: 'Lyon', description: 'healthy')
    review = Review.new(rating: 0, restaurant: lyon, content: 'blah')
    expect(review).not_to be_valid
  end

  context 'unpromoted restaurant' do 

    let(:kfc) { Restaurant.new(name: 'KFC', description: 'chicken') }

    it 'can be rated up to 4 stars' do 
      review = Review.new(rating: 4, restaurant: kfc, content: 'blah')
      expect(review).to be_valid
    end

    it 'can not be rated above 4 stars' do 
      review = Review.new(rating: 5, restaurant: kfc, content: 'blah')
      expect(review).not_to be_valid 
    end

  end

  context 'promoted restaurant' do

    let(:jing) { Restaurant.new(name: 'jing', description: 'tea for kings', promoted: true)}

    it 'can be rated at 5 stars' do 
      review = Review.new(rating: 5, restaurant: jing, content: 'blah')
      expect(review).to be_valid
    end

  end

end




