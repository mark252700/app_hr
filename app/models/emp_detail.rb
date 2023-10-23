class EmpDetail < ApplicationRecord
    validates :fullname, presence: true
    validates :emp_id, presence: true
    validates :rank, presence: true
    validates :division, presence: true
    validates :sup_name, presence: true
    validates :pos_title, presence: true
    validates :contact, presence: true
    validates :ser_year, presence: true
    validates :ser_month, presence: true
    validates :department, presence: true
    validates :sup_title, presence: true
    validates :educ_course, presence: true
    validates :educ_grad, presence: true
    validates :educ_certificate, presence: true
    validates :educ_skill, presence: true
    validates :educ_othskill, presence: true
    validates :hr_perday, presence: true
    validates :hr_perweek, presence: true
    validates :break, presence: true
    validates :launch, presence: true
  
    belongs_to :user
    has_many :benefits, dependent: :destroy


    accepts_nested_attributes_for :benefits, reject_if: :all_blank, allow_destroy: true
  #validate the benefits if his input has same data and has same id 
    
   
  end
  