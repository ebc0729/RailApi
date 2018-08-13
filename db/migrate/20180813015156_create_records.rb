class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.references :users, index: true, foreign_key: true
      t.references :routes, index: true, foreign_key: true
      t.references :start_station
      t.references :end_station
      t.timestamps null: false
    end
    add_foreign_key :records, :stations, column: :start_station_id
    add_foreign_key :records, :stations, column: :end_station_id
  end
end
