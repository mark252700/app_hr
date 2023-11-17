class ChangeDescriptionTypeInJbDescriptions < ActiveRecord::Migration[7.0]
  def change
    change_column :jb_descriptions, :description, :text
  end
end
