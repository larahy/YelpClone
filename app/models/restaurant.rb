class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :locations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 5}

  def average_rating
    reviews.average('rating') || 'Unrated'
  end

  alias_method :rating, :average_rating 
  
end
