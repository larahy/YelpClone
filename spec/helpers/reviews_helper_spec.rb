require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ReviewsHelper. For example:
#
# describe ReviewsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ReviewsHelper do

  let(:review) { Review.new }

  describe '.review_color' do

    context 'if review < 3 stars' do
      it 'should return alert-danger' do
        review.rating = 2
        expect(helper.review_color(review)).to eq 'alert-danger'
      end
    end

    context 'if review < 5 stars' do
      it 'should return alert-warning' do
        review.rating = 4
        expect(helper.review_color(review)).to eq 'alert-warning'
      end
    end

    context 'if review is 5 stars' do
      it 'should return alert-success' do
        review.rating = 5
        expect(helper.review_color(review)).to eq 'alert-success'
      end
    end
  
  end

  describe '.star_rating' do 

    context 'five stars' do 
      it 'should show five stars filled in' do 
        review.rating = 5
        expect(helper.star_rating(review)).to eq '★★★★★'
      end
    end

    context 'less than five stars' do 
      it 'should have some unfilled' do 
        review.rating = 3
        expect(helper.star_rating(review)).to eq '★★★☆☆'
      end
    end

  end

end
