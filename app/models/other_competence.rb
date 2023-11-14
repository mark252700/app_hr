class OtherCompetence < ApplicationRecord
  belongs_to :other_position

  validate :competencies, presence :true
end
