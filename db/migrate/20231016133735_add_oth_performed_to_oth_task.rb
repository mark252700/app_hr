class AddOthPerformedToOthTask < ActiveRecord::Migration[7.0]
  def change
    add_reference :oth_tasks, :user, null: false, foreign_key: true
  end
end
