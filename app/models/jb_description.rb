class JbDescription < ApplicationRecord
    belongs_to :user
    validates :description, presence: true

    has_many :jb_performeds, dependent: :destroy
    has_many :nested_descriptions, dependent: :destroy

    accepts_nested_attributes_for :jb_performeds,  reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :nested_descriptions,  reject_if: :all_blank, allow_destroy: true

    validates :jb_performeds, presence: true
end
