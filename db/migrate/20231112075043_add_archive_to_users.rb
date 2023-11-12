class AddArchiveToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :archive, :boolean
  end
end
