class AddTaskperformanceToNestedTaskperformance < ActiveRecord::Migration[7.0]
  def change
    add_reference :nested_taskperformances, :taskperformance, null: false, foreign_key: true
  end
end
