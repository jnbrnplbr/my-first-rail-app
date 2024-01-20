class Role < ApplicationRecord
    validates :name, :code, presence: true
    belongs_to :user, class_name: 'User', foreign_key: 'created_by', optional: false
end
