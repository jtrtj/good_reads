class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def highest_review
    reviews.order(:rating)[-1]
  end

  def lowest_review
    reviews.order(:rating)[0]
  end

  def avg_rating
    reviews.average(:rating)
  end

  def highest_rating
    reviews.maximum(:rating)
  end

  def lowest_rating
    reviews.minimum(:rating)
  end
end
