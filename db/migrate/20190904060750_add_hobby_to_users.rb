class AddHobbyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hobby, :integer, null: false, default: 0
  end
end
