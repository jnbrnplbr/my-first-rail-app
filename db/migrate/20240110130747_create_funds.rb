class CreateFunds < ActiveRecord::Migration[7.1]
  def change
    create_table :funds do |t|
      t.string :name
      t.string :category
      t.float :amount
      t.integer :created_by

      t.timestamps
    end
    add_index :funds, :created_by
  end
end
