class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  scope :reviews_with_id, -> { where.not(restaurant_id: nil) }
  scope :star_repeat_select, -> {
    {
      "★★★★★" => 5,
      "★★★★"  => 4,
      "★★★"   => 3,
      "★★"    => 2,
      "★"     => 1
    }
  }
end
