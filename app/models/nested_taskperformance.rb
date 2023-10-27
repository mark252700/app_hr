class NestedTaskperformance < ApplicationRecord
    belongs_to :taskperformance

    validates :task_notdone, :task_reason, :task_impact, presence: true
end
