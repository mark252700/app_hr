class CreateRequestTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :request_trainings do |t|
      t.string :train_type
      t.string :train_benefit

      t.timestamps
    end
  end
end
