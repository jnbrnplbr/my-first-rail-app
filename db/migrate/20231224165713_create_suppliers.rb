class CreateSuppliers < ActiveRecord::Migration[7.1]
  def change
    create_table :suppliers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :point_person, null: false
      t.string :contact_number, null: false
      t.integer :created_by, null: false

      t.timestamps
    end
    add_index :suppliers, :created_by
  end
end
