class AddJbDescriptionToJbPerformed < ActiveRecord::Migration[7.0]
  def change
    add_reference :jb_performeds, :jb_description, null: false, foreign_key: true
  end
end
