class CreateOtherCompetencies < ActiveRecord::Migration[7.0]
  def change
    create_table :other_competencies do |t|
      t.string :competencies

      t.timestamps
    end
  end
end
