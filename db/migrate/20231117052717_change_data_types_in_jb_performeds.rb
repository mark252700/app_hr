class ChangeDataTypesInJbPerformeds < ActiveRecord::Migration[7.0]
  def change
    change_column :jb_performeds, :job_performed, :text
    change_column :jb_performeds, :job_reason, :text
  end
end
