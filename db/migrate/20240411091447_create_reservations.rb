class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.date "day", null: false
      t.string "time", null: false
      t.references :user, foreign_key: true, type: :bigint
      t.datetime "start_time", null: false

      t.timestamps
    end
  end
end
