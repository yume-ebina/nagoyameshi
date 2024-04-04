class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  enum score: { five: 5, four: 4, three: 3, two: 2, one: 1 }

end
