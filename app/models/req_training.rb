class ReqTraining < ApplicationRecord
    belongs_to :user
    has_many :nested_trainings, dependent: :destroy
    has_many :rel_trainings, dependent: :destroy
    has_many :notrel_trainings, dependent: :destroy

    accepts_nested_attributes_for :nested_trainings, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :rel_trainings, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :notrel_trainings, reject_if: :all_blank, allow_destroy: true
   
end
