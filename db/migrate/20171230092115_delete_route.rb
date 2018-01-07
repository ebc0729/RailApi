class DeleteRoute < ActiveRecord::Migration[5.1]
  def change
		drop_table :routes
  end
end
