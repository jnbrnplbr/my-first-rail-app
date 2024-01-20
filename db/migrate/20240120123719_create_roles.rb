class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :code
      t.string :menu_actions, null: true, default: ""
      t.integer :created_by

      t.timestamps
    end
  end
end
