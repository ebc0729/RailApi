class ChangeDatatypeDataOfRails < ActiveRecord::Migration[5.1]
  def change
		change_column :rails, :data, :text
  end
end
