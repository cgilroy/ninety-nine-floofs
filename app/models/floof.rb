require "action_view"

class Floof < ApplicationRecord
    include ActionView::Helpers::DateHelper
    COLORS = %w(cream black white grey orange brown)
    validates :sex, inclusion: { in: %w(M F) }
    validates :name, :birth_date, :sex, :color, :description, presence:true
    validates :color, inclusion: { in: COLORS }

    has_many :rental_requests, 
        foreign_key: :floof_id,
        primary_key: :id,
        class_name: :FloofRentalRequest,
        dependent: :destroy

    def age
        time_ago_in_words(birth_date)
    end
end
