class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :created_by

      t.timestamps
    end
  end
end
