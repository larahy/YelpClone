class AddRestaurantIdToLocations < ActiveRecord::Migration
  def change
    add_reference :locations, :restaurant, index: true
  end
end
