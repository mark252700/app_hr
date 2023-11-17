class ChangeDescriptionTypeInNestedDescriptions < ActiveRecord::Migration[7.0]
  def change
    change_column :nested_descriptions, :description, :text
  end
end
