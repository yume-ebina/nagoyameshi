class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :restaurants, through: :likes
  has_many :reservations, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  enum role: { general: 0, admin: 1 }

  def liked?(restaurant)
    self.likes.exists?(restaurant_id: restaurant.id)
  end
end
