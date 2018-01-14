class AddRailOrderToStation < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :rail_order, :integer
  end
end
