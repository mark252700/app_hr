class CreateJbPerformeds < ActiveRecord::Migration[7.0]
  def change
    create_table :jb_performeds do |t|
      t.string :job_performed
      t.string :job_done
      t.integer :job_hr
      t.integer :job_min
      t.boolean :job_current
      t.string :job_reason

      t.timestamps
    end
  end
end
