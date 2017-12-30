class DeleteLines < ActiveRecord::Migration[5.1]
  def change
		drop_table :lines
  end
end
