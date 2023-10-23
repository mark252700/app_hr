class AddOthPerformedToOthCompetency < ActiveRecord::Migration[7.0]
  def change
    add_reference :oth_competencies, :oth_performed, null: false, foreign_key: true
  end
end
