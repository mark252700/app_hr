class EmpDetail < ApplicationRecord
  validates :firstname, :middlename, :lastname, :emp_id, :rank, :division, :sup_name, :pos_title, :contact, :ser_year, :ser_month, :department, :sup_title, :educ_course, :educ_grad, :educ_certificate, :educ_skill, :educ_othskill, :hr_perday, :hr_perweek, :break, :launch, presence: true


    belongs_to :user
    has_many :benefits, dependent: :destroy


    accepts_nested_attributes_for :benefits, reject_if: :all_blank, allow_destroy: true



    validates :benefits, presence: true

  end
