class CreateSuppliers < ActiveRecord::Migration[7.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.integer :created_by

      t.timestamps
    end
    add_index :suppliers, :created_by
  end
end
