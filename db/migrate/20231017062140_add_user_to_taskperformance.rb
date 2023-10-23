class AddUserToTaskperformance < ActiveRecord::Migration[7.0]
  def change
    add_reference :taskperformances, :user, null: false, foreign_key: true
  end
end
