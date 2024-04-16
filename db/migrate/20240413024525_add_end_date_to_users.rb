class AddEndDateToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :premium_end_date, :date
  end
end
