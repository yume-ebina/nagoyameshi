class Restaurant < ApplicationRecord
  belongs_to :category
  has_many :reviews

  def reviews_with_id
    reviews.reviews_with_id
  end
end
