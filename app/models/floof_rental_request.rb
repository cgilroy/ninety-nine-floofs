class FloofRentalRequest < ApplicationRecord
    validates :floof_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: %w(PENDING APPROVED DENIED)
    

    belongs_to :floof


    

    def overlapping_requests
        FloofRentalRequest.where.not(id: self.id)
        .where(floof_id: self.floof_id)
        .where.not('start_date > :end_date OR end_date < :start_date',
            start_date: self.start_date, end_date: self.end_date)
    end
end
