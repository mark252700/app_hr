class JbDescription < ApplicationRecord
    belongs_to :user
    has_many :jb_performeds, dependent: :destroy

    accepts_nested_attributes_for :jb_performeds,  reject_if: :all_blank, allow_destroy: true
end
