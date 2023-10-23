class CreateEmpDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :emp_details do |t|
      t.string :fullname
      t.integer :emp_id
      t.string :rank
      t.string :division
      t.string :sup_name
      t.string :pos_title
      t.integer :ser_year
      t.integer :ser_month
      t.string :educ_course
      t.datetime :educ_grad
      t.string :educ_skill
      t.string :educ_certificate
      t.string :educ_othskill
      t.string :contact
      t.string :department
      t.string :sup_title
      t.integer :hr_perday
      t.integer :hr_perweek
      t.string :break
      t.string :launch
      t.boolean :ot_weekday
      t.boolean :ot_weekend
      t.integer :workday

      t.timestamps
    end
  end
end
