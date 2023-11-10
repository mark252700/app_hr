class User < ApplicationRecord
  has_one :emp_detail, class_name: 'EmpDetail', dependent: :destroy
  has_one :jb_description, class_name: 'JbDescription', dependent: :destroy
  has_one :taskperformance, class_name: 'Taskperformance', dependent: :destroy
  has_one :oth_performed, class_name: 'OthPerformed', dependent: :destroy
  has_one :req_training, class_name: 'ReqTraining', dependent: :destroy

  has_many :other_positions, dependent: :destroy
  accepts_nested_attributes_for :other_positions, allow_destroy: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         def active_for_authentication?
          super && approved?
        end

        def inactive_message
          approved? ? super : "Your account has not been approved yet."
        end


  def admin?
    role == true
  end
end
