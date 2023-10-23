class RemoveTaskPerformanceIdFromCompetencies < ActiveRecord::Migration[7.0]
  def change
    remove_column :competencies, :task_performance_id
  end
end