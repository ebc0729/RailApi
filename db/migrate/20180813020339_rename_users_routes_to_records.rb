class RenameUsersRoutesToRecords < ActiveRecord::Migration[5.1]
  def change
    rename_column :records, :users_id, :user_id
    rename_column :records, :routes_id, :route_id
  end
end
