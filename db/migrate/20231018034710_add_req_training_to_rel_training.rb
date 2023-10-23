class AddReqTrainingToRelTraining < ActiveRecord::Migration[7.0]
  def change
    add_reference :rel_trainings, :req_training, null: false, foreign_key: true
  end
end
