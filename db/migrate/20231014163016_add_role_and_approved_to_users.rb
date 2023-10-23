class AddRoleAndApprovedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :boolean, default: false
    add_column :users, :approved, :boolean, default: false
  end
end
