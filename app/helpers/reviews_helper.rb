module ReviewsHelper

  def star_rating(review)
    return 'Unrated' if review.rating == 'Unrated'
    empty = 5 - review.rating
    ('★' * review.rating)+('☆' * empty)
  end

  def review_color(review)
    case review.rating
    when 1..2
      'alert-danger'
    when 3..4
      'alert-warning'
    when 5
      'alert-success'
    end
  end

end
