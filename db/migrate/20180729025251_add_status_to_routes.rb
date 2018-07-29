class AddStatusToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :status, :integer, default: 0
    add_index :routes, :status
  end
end
