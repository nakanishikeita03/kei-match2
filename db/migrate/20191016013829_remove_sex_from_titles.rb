class RemoveSexFromTitles < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :sex, :integer
    remove_column :users, :hobby, :integer
  end
end
