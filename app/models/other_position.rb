class OtherPosition < ApplicationRecord
  belongs_to :user
  has_many :other_perfromeds, dependent: :destroy
  has_many :other_taskperformances, dependent: :destroy
  has_many :other_competences, dependent: :destroy

  accepts_nested_attributes_for :other_perfromeds, allow_destroy: true
  accepts_nested_attributes_for :other_taskperformances, allow_destroy: true
  accepts_nested_attributes_for :other_competences, allow_destroy: true


  validates :other_perfromeds, presence: true
  validates :other_taskperformances, presence: true
  validates :other_competences, presence: true
  validates :pos_yr, :pos_month, presence: true

end
