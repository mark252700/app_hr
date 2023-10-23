class AddOthPerformedToOthPosition < ActiveRecord::Migration[7.0]
  def change
    add_reference :oth_positions, :oth_performed, null: false, foreign_key: true
  end
end
