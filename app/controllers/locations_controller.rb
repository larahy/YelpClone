class LocationsController < ApplicationController

  def new
    @restaurant = Restaurant.find params[:restaurant_id]
    @location = Location.new
  end

  def create
    @restaurant = Restaurant.find params[:restaurant_id]
    @restaurant.locations << Location.create(params[:location].permit(:name, :takeaway))
    redirect_to @restaurant
  end
end
