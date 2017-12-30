class RenameLineIdColumnToStations < ActiveRecord::Migration[5.1]
  def change
		rename_column :stations, :line_id, :route_id
  end
end
