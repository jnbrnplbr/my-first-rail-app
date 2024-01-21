class CreateHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :histories do |t|
      t.string :name
      t.string :action
      t.string :description
      t.belongs_to :module, null: false, foreign_key: true

      t.timestamps
    end
  end
end
