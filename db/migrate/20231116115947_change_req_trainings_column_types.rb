class ChangeReqTrainingsColumnTypes < ActiveRecord::Migration[7.0]
  def change
    change_column :req_trainings, :train_type, :text
    change_column :req_trainings, :train_benefit, :text
    change_column :req_trainings, :sup_name, :text
    change_column :req_trainings, :sup_title, :text
  end
end
