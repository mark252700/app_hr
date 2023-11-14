class OtherPerfromed < ApplicationRecord
  belongs_to :other_position

  validate :job_performed, :job_done, :job_hr, :job_min, :job_reason, presence :true
end
