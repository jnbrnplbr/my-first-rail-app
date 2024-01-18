class CreateInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.string :serial_number
      t.string :model
      t.integer :quantity
      t.belongs_to :unit
      t.belongs_to :category
      t.belongs_to :brand
      t.belongs_to :project
      t.integer :allocated_to
      t.integer :created_by
      t.timestamps
    end
  end
end
