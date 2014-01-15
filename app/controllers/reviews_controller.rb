class ReviewsController < ApplicationController

  before_action :authenticate_member!

  def new
    @restaurant = Restaurant.find params[:restaurant_id]
    @review = Review.new(restaurant: @restaurant)
    @review.member = current_member
  end

  def create
    @restaurant = Restaurant.find params[:restaurant_id]
    @review = Review.new(params[:review].permit(:content, :rating))
    @review.member = current_member
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
    render 'new'
    end

  end

end
