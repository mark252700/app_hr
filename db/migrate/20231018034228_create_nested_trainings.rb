class CreateNestedTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :nested_trainings do |t|
      t.string :train_type
      t.string :train_benefit
      t.string :sup_name
      t.string :sup_title

      t.timestamps
    end
  end
end
