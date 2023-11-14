class OtherCompetence < ApplicationRecord
  belongs_to :other_position

  validates :competencies, presence: true
end
