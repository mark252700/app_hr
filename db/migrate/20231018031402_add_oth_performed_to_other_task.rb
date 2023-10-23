class AddOthPerformedToOtherTask < ActiveRecord::Migration[7.0]
  def change
    add_reference :other_tasks, :oth_performed, null: false, foreign_key: true
  end
end
