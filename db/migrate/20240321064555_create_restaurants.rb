class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.integer :lowest_price
      t.integer :highest_price
      t.string :opening_hours
      t.string :closing_hours
      t.string :postal_code
      t.string :adress
      t.string :tel
      t.string :regular_holiday
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
