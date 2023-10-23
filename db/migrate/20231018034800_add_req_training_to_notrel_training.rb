class AddReqTrainingToNotrelTraining < ActiveRecord::Migration[7.0]
  def change
    add_reference :notrel_trainings, :req_training, null: false, foreign_key: true
  end
end
