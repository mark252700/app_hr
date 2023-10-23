class User < ApplicationRecord
  has_one :emp_detail, dependent: :destroy
  has_one :jb_description, dependent: :destroy
  has_one :taskperformance, dependent: :destroy
  has_one :oth_performed, dependent: :destroy
  has_one :req_training, dependent: :destroy

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
