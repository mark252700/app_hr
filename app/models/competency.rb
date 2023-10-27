class Competency < ApplicationRecord
    belongs_to :taskperformance

    validates :competencies, presence: true
end
