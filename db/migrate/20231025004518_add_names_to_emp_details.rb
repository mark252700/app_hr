class AddNamesToEmpDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :emp_details, :firstname, :string
    add_column :emp_details, :middlename, :string
    add_column :emp_details, :lastname, :string
  end
end
