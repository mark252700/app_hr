class ChangeNestedTaskperformanceColumnsType < ActiveRecord::Migration[7.0]
  def change
    change_column :nested_taskperformances, :task_notdone, :text
    change_column :nested_taskperformances, :task_reason, :text
    change_column :nested_taskperformances, :task_impact, :text
  end
end
