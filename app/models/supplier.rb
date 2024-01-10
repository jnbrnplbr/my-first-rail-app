class Supplier < ApplicationRecord
    attr_accessor :current_user
    validates :name, :email, :point_person, :contact_number, presence: true
    belongs_to :created_by_user, class_name: 'User', foreign_key: 'created_by', optional: false
    before_create :set_created_by

    private
  
    def set_created_by
      self.created_by = current_user.id if current_user
    end
end
