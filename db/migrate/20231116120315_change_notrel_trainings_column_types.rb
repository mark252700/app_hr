class ChangeNotrelTrainingsColumnTypes < ActiveRecord::Migration[7.0]
  def change
    change_column :notrel_trainings, :train_type, :text
    change_column :notrel_trainings, :train_benefit, :text
  end
end
