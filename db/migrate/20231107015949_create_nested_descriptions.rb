class CreateNestedDescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :nested_descriptions do |t|
      t.text :description

      t.timestamps
    end
  end
end
