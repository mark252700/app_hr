class JbPerformed < ApplicationRecord
    belongs_to :jb_description

    validates :job_performed, :job_done, :job_hr, :job_min, :job_reason, presence: true
end
