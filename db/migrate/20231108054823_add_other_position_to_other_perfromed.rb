class AddOtherPositionToOtherPerfromed < ActiveRecord::Migration[7.0]
  def change
    add_reference :other_perfromeds, :other_position, null: false, foreign_key: true
  end
end
