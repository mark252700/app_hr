class AddTaskPerformanceToCompetency < ActiveRecord::Migration[7.0]
  def change
    add_reference :competencies, :taskperformance, null: false, foreign_key: true
  end
end
