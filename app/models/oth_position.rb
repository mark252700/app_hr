class OthPosition < ApplicationRecord
    belongs_to :oth_performed

    validates :pos_title, :pos_yr, :pos_month, presence: true
end
