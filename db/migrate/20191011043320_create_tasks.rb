class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :language, null: false
      t.integer :time, null: false
      t.references :post, null: false
      t.timestamps
    end
  end
end
