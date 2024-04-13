class AddTokenUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :token, :string, default: ""
  end
end
