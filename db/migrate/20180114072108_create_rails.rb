class CreateRails < ActiveRecord::Migration[5.1]
  def change
    create_table :rails do |t|
      t.integer :route_id
      t.string :data
      t.integer :order
      t.boolean :is_station

      t.timestamps
    end
  end
end
