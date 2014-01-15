class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :locations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 5}

  def average_rating
    return 'unrated' if reviews.none?
    total = reviews.inject(0) {|sum, review| sum += review.rating }
    total/reviews.length
  end
end
