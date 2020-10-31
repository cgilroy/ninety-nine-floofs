require "action_view"

class Floof < ApplicationRecord
    include ActionView::Helpers::DateHelper
    validates :sex, length: { maximum: 1 }
    validates :name, :birth_date, :sex, :color, :description, presence:true
    validates :color, inclusion: { in: %w(cream black white grey orange) }
    def age
        time_ago_in_words(birth_date)
    end
end
