class CreateOthTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :oth_tasks do |t|
      t.string :oth_tasknotdone
      t.string :oth_reason
      t.string :oth_impact

      t.timestamps
    end
  end
end
