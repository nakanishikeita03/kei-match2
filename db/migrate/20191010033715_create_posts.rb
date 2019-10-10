class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :text, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end