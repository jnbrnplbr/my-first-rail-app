class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :description
      t.integer :supplier_id
      t.integer :created_by
      t.timestamps
    end
    add_index :projects, :supplier_id
  end
end
