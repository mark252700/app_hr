class CreateOtherCompetences < ActiveRecord::Migration[7.0]
  def change
    create_table :other_competences do |t|
      t.string :competencies

      t.timestamps
    end
  end
end
