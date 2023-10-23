class AddTaskPerfomanceToCompetency < ActiveRecord::Migration[7.0]
  def change
    add_reference :competencies, :task_performance, null: false, foreign_key: true
  end
end
