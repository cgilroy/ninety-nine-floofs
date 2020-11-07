class FloofRentalRequest < ApplicationRecord
    validates :floof_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: %w(PENDING APPROVED DENIED)
    
end
