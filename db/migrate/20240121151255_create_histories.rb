class CreateHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :histories do |t|
      t.string :action
      t.string :module
      t.string :description
      t.integer :created_by
      t.timestamps
    end
  end
end
