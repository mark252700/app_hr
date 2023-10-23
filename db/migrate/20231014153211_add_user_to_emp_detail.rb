class AddUserToEmpDetail < ActiveRecord::Migration[7.0]
  def change
    add_reference :emp_details, :user, null: false, foreign_key: true
  end
end
