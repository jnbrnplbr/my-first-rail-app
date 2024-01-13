class Supplier < ApplicationRecord
    validates :name, :email, :point_person, :contact_number, presence: true
    belongs_to :created_by_user, class_name: 'User', foreign_key: 'created_by', optional: false
end
