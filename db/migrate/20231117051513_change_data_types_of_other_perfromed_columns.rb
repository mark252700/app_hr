class ChangeDataTypesOfOtherPerfromedColumns < ActiveRecord::Migration[7.0]
  def change
    create_table :other_perfromed do |t|
      t.text :job_performed # Change data type to text
      t.string :job_done
      t.integer :job_hr
      t.integer :job_min
      t.boolean :job_current
      t.text :job_reason # Change data type to text

      t.timestamps
    end
  end
end
