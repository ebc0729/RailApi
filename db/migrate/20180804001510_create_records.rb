class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.references :user, foreign_key: true
      t.references :route, foreign_key: true
      t.integer :start_order
      t.integer :end_order

      t.timestamps
    end
  end
end
