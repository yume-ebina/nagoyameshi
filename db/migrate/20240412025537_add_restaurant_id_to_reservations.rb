class AddRestaurantIdToReservations < ActiveRecord::Migration[7.1]
  def change
    add_reference :reservations, :restaurant, null: false, foreign_key: true, type: :bigint
  end
end
