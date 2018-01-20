class RenameOrderColumnToRails < ActiveRecord::Migration[5.1]
  def change
		rename_column :rails, :order, :rail_order
  end
end
