class DropRecords < ActiveRecord::Migration[5.1]
  def change
    drop_table :records
  end
end
