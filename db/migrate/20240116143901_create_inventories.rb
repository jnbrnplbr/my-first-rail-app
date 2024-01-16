class CreateInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.string :serial_number
      t.string :model
      t.integer :quantity

      t.timestamps
    end
  end
end
