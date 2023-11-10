class EmpDetail < ApplicationRecord
  validates :emp_id, uniqueness: true
  validates :contact, presence: true, format: { with: /\A\d{11}\z/, message: "should be 11 digits long and contain only numbers" }

  validates :firstname, :middlename, :lastname, :emp_id, :rank, :division, :sup_name, :pos_title, :contact, :ser_year, :ser_month, :department, :sup_title, :educ_course, :educ_grad, :educ_skill, :educ_othskill, :hr_perday, :hr_perweek, :break, :launch, :workday, presence: true

  belongs_to :user
  has_many :benefits, dependent: :destroy

  accepts_nested_attributes_for :benefits, allow_destroy: true

  validates :benefits, presence: true
end
