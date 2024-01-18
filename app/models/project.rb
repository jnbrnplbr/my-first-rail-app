class Project < ApplicationRecord
    validates :description, :bid_amount, :supplier_id, :purchase_request_amount, :fund_id, :solicitation_number , :notice_of_award, :purchase_order, presence: true
    belongs_to :created_by_user, class_name: 'User', foreign_key: 'created_by', optional: false
    belongs_to :fund
    belongs_to :supplier
    has_many :inventory
end
