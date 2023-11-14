class OtherTaskperformance < ApplicationRecord
  belongs_to :other_position

  validates :task_notdone, :task_reason, :task_impact, presence: true
end
