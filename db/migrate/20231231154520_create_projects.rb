class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :description
      t.float :bid_amount
      t.float :purchase_request_amount
      t.belongs_to :fund, foreign_key: true
      t.belongs_to :supplier, null: false
      t.string :specification, null: true, default: ""
      t.string :notice_of_award, null: true, default: ""
      t.string :notice_to_proceed, null: true, default: ""
      t.string :purchase_order, null: true, default: ""
      t.integer :created_by
      t.timestamps
    end
  
  end
end
