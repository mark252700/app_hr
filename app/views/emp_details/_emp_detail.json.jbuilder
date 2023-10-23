json.extract! emp_detail, :id, :fullname, :emp_id, :rank, :division, :sup_name, :pos_title, :ser_year, :ser_month, :educ_course, :educ_grad, :educ_skill, :educ_certificate, :educ_othskill, :contact, :department, :sup_title, :hr_perday, :hr_perweek, :break, :launch, :ot_weekday, :ot_weekend, :workday, :created_at, :updated_at
json.url emp_detail_url(emp_detail, format: :json)
