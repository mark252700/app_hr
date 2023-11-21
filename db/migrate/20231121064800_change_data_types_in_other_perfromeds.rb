class ChangeDataTypesInOtherPerfromeds < ActiveRecord::Migration[7.0]
  def change
    change_column :other_perfromeds, :job_performed, :text
    change_column :other_perfromeds, :job_reason, :text
  end
end
