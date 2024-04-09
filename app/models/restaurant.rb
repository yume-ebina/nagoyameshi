class Restaurant < ApplicationRecord
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  PER = 10

  scope :display_list, -> (category, page) {
    if category != "none"
      where(category_id: category).page(page).per(PER)
    else
      page(page).per(PER)
    end
  }

end
