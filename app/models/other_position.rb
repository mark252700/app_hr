class OtherPosition < ApplicationRecord
  belongs_to :user
  has_many :other_perfromeds, dependent: :destroy
  has_many :other_taskperformances, dependent: :destroy
  has_many :other_competences, dependent: :destroy

  accepts_nested_attributes_for :other_perfromeds, allow_destroy: true
  accepts_nested_attributes_for :other_taskperformances, allow_destroy: true
  accepts_nested_attributes_for :other_competences, allow_destroy: true

  validate :other_perfromeds, presence :true
  validate :other_taskperformances, presence :true
  validate :other_competences, presence :true

end
