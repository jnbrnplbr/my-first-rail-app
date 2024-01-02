class Supplier < ApplicationRecord
    validates :name, :created_by, presence: true
end
