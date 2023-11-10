class RelTraining < ApplicationRecord
    belongs_to :req_training

    validates :train_type, :train_benefit, presence: true
end
