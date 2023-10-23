class OthPerformed < ApplicationRecord
    belongs_to :user
    has_many :other_competencies, dependent: :destroy
    has_many :nested_othperformes , dependent: :destroy
    has_many :other_tasks, dependent: :destroy
    has_one :oth_position, dependent: :destroy

    accepts_nested_attributes_for :other_competencies, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :nested_othperformes, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :other_tasks, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :oth_position, reject_if: :all_blank, allow_destroy: true
end
