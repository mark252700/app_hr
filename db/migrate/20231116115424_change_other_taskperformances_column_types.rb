class ChangeOtherTaskperformancesColumnTypes < ActiveRecord::Migration[7.0]
  def change
    change_column :other_taskperformances, :task_notdone, :text
    change_column :other_taskperformances, :task_reason, :text
    change_column :other_taskperformances, :task_impact, :text
  end
end
