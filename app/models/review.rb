class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :member
  validates :content, presence: true
  validates :rating, inclusion: {in: :valid_ratings.to_proc, message: 'must be selected'}

  def valid_ratings
    if restaurant.promoted?
      return 1..5
    else
      1..4
    end
  end

end
