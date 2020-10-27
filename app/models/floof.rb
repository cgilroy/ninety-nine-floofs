class Floof < ApplicationRecord
    validates :sex, length: { maximum: 1 }
    validates :name, :birth_date, :sex, :color, :description, presence:true
end
