class AddJbDescriptionToNestedDescription < ActiveRecord::Migration[7.0]
  def change
    add_reference :nested_descriptions, :jb_description, null: false, foreign_key: true
  end
end
