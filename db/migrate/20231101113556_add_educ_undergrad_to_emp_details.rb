class AddEducUndergradToEmpDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :emp_details, :educ_undergrad, :string
  end
end
