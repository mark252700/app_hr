class CreateRelTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :rel_trainings do |t|
      t.string :train_type
      t.string :train_benefit

      t.timestamps
    end
  end
end
