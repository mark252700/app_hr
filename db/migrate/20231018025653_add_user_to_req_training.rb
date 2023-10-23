class AddUserToReqTraining < ActiveRecord::Migration[7.0]
  def change
    add_reference :req_trainings, :user, null: false, foreign_key: true
  end
end
