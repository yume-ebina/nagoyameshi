# This file should ensure the existence of records required to run the application in every environment (restaurantion,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# User.create!(
#   email: ENV["ADMIN_EMAIL"],
#   password: 'hogehoge',
#   encrypted_password: 'hogehoge',
#   name: 'テスト管理者',
#   kana: 'カンリシャ',
#   gender: 'female',
#   birthday: '1999-12-24',
#   role: 'admin'
# )

categories = ["和食","イタリアン","中華","フレンチ","韓国料理","タイ料理","ラーメン"]
categories.each do |category|
  Category.create(
    name: category
  )
end

restaurant_ids = [*1..30]
category_ids = [*1..7,*1..12]
array_number = 0

restaurant_ids.each do
  restaurant_name = Faker::Music::RockBand.name
  Restaurant.create(
    name: restaurant_name,
    description: restaurant_name,
    lowest_price: restaurant_ids[array_number],
    highest_price: restaurant_ids[array_number],
    opening_hours: restaurant_ids[array_number],
    closing_hours: restaurant_ids[array_number],
    postal_code: restaurant_ids[array_number],
    adress: restaurant_name,
    tel: "000-000-000",
    regular_holiday: "なし",
    category_id: category_ids[array_number]
  )
  array_number += 1
end