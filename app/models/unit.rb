class Unit < ApplicationRecord
    validates :name, :slug, presence: true
    belongs_to :user, class_name: 'User', foreign_key: 'created_by', optional: false
    has_many :inventory
end
