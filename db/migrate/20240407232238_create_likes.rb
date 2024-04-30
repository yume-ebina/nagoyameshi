class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true, type: :bigint
      t.references :restaurant, null: false, foreign_key: true, type: :bigint

      t.timestamps
    end
  end
end
