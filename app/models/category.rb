class Category < ApplicationRecord
  has_many :restaurants

  scope :request_category, -> (category) {
    if category != "none"
      find(category.to_i)
    else
      ""
    end
  }
end
