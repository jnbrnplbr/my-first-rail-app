class Fund < ApplicationRecord
    validates :name, :category, :amount, presence: true
    belongs_to :created_by_user, class_name: 'User', foreign_key: 'created_by', optional: false
    has_many :project
end
