class Project < ApplicationRecord
    belongs_to :created_by_user, class_name: 'User', foreign_key: 'created_by', optional: false
    belongs_to :fund
    belongs_to :supplier
end
