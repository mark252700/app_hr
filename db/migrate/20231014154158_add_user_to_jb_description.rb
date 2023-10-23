class AddUserToJbDescription < ActiveRecord::Migration[7.0]
  def change
    add_reference :jb_descriptions, :user, null: false, foreign_key: true
  end
end
