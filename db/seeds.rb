# This file should ensure the existence of records required to run the application in every environment (restaurantion,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!(
  email: "cityeventa@gmail.com",
  password: 'hogehoge',
  password_confirmation: 'hogehoge',
  name: 'テスト管理者',
  kana: 'カンリシャ',
  gender: 'female',
  birthday: '1999-12-24',
  role: 'admin',
  confirmed_at: Time.current,
  confirmation_token: nil
)

# categories = [*1..7]
# categories.each do |category|
#   Category.create(
#     name: categories[array_number]
#   )
#   array_number += 1
# end
pp 'start seed'

30.times.each do |i|
  restaurant_name = Faker::Music::RockBand.name
  postal_code = Faker::Address.postcode
  tel = Faker::PhoneNumber.cell_phone
  r = Restaurant.new(
    name: restaurant_name,
    description: restaurant_name,
    lowest_price: rand(1..3)*1000,
    highest_price: rand(3..7)*1000,
    opening_hours: rand(6..10),
    closing_hours: rand(15..23),
    postal_code: postal_code,
    adress: restaurant_name,
    tel: tel,
    regular_holiday: "なし",
    category_id: rand(1..7)
  )
  r.save!
end