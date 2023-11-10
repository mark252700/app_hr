class CreateNestedDescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :nested_descriptions do |t|
      t.string :description

      t.timestamps
    end
  end
end
