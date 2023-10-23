class AddUserToTaskPerfomance < ActiveRecord::Migration[7.0]
  def change
    add_reference :task_performances, :user, null: false, foreign_key: true
  end
end
