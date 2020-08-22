class CreateGrowthRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :growth_records do |t|
      t.integer :plant_id, null: false
      t.datetime :record_time
      t.float :temp, null: false
      t.float :humid, null: false
      t.timestamps
    end
  end
end
