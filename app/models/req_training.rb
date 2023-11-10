class ReqTraining < ApplicationRecord
    belongs_to :user
    has_many :nested_trainings, dependent: :destroy
    has_many :rel_trainings, dependent: :destroy
    has_many :notrel_trainings, dependent: :destroy
    has_many :request_trainings, dependent: :destroy

    accepts_nested_attributes_for :nested_trainings, allow_destroy: true
    accepts_nested_attributes_for :rel_trainings, allow_destroy: true
    accepts_nested_attributes_for :notrel_trainings, allow_destroy: true
    accepts_nested_attributes_for :request_trainings, allow_destroy: true


    validates :train_type, :train_benefit, presence: true
    validates :rel_trainings, presence: true
    validates :notrel_trainings, presence: true
    validates :request_trainings, presence: true

end
