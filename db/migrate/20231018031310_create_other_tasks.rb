class CreateOtherTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :other_tasks do |t|
      t.string :task_notdone
      t.string :task_reason
      t.string :task_impact

      t.timestamps
    end
  end
end
