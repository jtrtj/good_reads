class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def avg_rating
    reviews.average(:rating)
  end
end
