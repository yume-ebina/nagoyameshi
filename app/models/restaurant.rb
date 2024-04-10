class Restaurant < ApplicationRecord
  # belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  enum category_id: {
    japanese: 1,
    italian: 2,
    chinese: 3,
    french: 4,
    korean: 5,
    thai: 6,
    ramen: 7, }
end
