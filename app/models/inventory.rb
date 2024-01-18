class Inventory < ApplicationRecord
    belongs_to :allocated_to_user, class_name: 'User', foreign_key: 'allocated_to', optional: false
    belongs_to :created_by_user, class_name: 'User', foreign_key: 'created_by', optional: false
    belongs_to :category
    belongs_to :brand
    belongs_to :project
    belongs_to :unit
    validates :serial_number, :model, :quantity, :unit_id, :category_id, :brand_id, :allocated_to, :project_id, presence: true
end
