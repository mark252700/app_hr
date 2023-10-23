class CreateReqCompetencies < ActiveRecord::Migration[7.0]
  def change
    create_table :req_competencies do |t|
      t.string :competencies

      t.timestamps
    end
  end
end
