class CreateOthCompetencies < ActiveRecord::Migration[7.0]
  def change
    create_table :oth_competencies do |t|
      t.string :competency

      t.timestamps
    end
  end
end
