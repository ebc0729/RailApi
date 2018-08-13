class RenameOrderToRecords < ActiveRecord::Migration[5.1]
  def change
    rename_column :records, :start_order, :start_station_id
    rename_column :records, :end_order, :end_station_id
  end
end
