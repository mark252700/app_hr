class CreateNotrelTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :notrel_trainings do |t|
      t.string :train_type
      t.string :train_benefit

      t.timestamps
    end
  end
end
