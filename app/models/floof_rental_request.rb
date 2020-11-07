class FloofRentalRequest < ApplicationRecord
    validates :floof_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: %w(PENDING APPROVED DENIED)
    validate :does_not_overlap_approved_request
    

    belongs_to :floof


    
    private
    
    def overlapping_requests
        FloofRentalRequest.where.not(id: self.id)
        .where(floof_id: self.floof_id)
        .where.not('start_date > :end_date OR end_date < :start_date',
            start_date: self.start_date, end_date: self.end_date)
    end

    def overlapping_approved_requests
        overlapping_requests.where(status: 'APPROVED')
    end

    def does_not_overlap_approved_request
        return if self.status == 'DENIED'
        if overlapping_approved_requests.exists?
            errors[:base] << 'Request overlaps with existing rental'
        end
    end
end
