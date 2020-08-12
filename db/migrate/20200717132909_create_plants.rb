class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.integer :user_id, null: false
      t.string :plant_name, null: false
      t.string :img
      t.timestamps
    end
  end
end
