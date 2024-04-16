class Restaurant < ApplicationRecord
  # belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :reservations
  has_one_attached :image

  validate :image_content_type
  validate :image_size

  #ファイル形式バリデーション
  def image_content_type
    if image.attached? && !image.content_type.in?(%w[image/jpeg image/png])
      errors.add(:image, ':ファイル形式が、JPEG, PNG以外になってます。ファイル形式をご確認ください。')
    end
  end

  #ファイルサイズバリデーション
  def image_size
    if image.attached? && image.blob.byte_size > 1.megabytes
      errors.add(:image, ':1MB以下のファイルをアップロードしてください。')
    end
  end

  #サムネイル用にリサイズ
  def thumbnail
    return unless image.content_type.in?(%w[image/jpeg image/png])
    image.variant(resize_to_limit: [200, 100]).processed
  end

  def large_thumbnail
    return unless image.content_type.in?(%w[image/jpeg image/png])
    image.variant(resize_to_limit: [600, 700]).processed
  end

  enum category_id: {
    japanese: 1,
    italian: 2,
    chinese: 3,
    french: 4,
    korean: 5,
    thai: 6,
    ramen: 7, }
end
