class CreateBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.integer :created_by

      t.timestamps
    end
  end
end
