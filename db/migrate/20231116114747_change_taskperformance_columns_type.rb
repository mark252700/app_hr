class ChangeTaskperformanceColumnsType < ActiveRecord::Migration[7.0]
  def change
    change_column :taskperformances, :task_notdone, :text
    change_column :taskperformances, :task_reason, :text
    change_column :taskperformances, :task_impact, :text
  end
end
