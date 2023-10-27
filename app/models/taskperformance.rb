class Taskperformance < ApplicationRecord

  belongs_to :user
  validates :task_notdone, :task_reason, :task_impact, presence: true

  has_many :competencies, dependent: :destroy
  has_many :nested_taskperfomances, class_name: 'NestedTaskperformance', dependent: :destroy

  accepts_nested_attributes_for :nested_taskperfomances, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :competencies, reject_if: :all_blank, allow_destroy: true

  validates :nested_taskperfomances, presence: true
  validates :competencies, presence: true
end
