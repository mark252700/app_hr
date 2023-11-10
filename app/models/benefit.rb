class Benefit < ApplicationRecord
    belongs_to :emp_detail

    validates :benefit, presence: true
end
