class AddEmpDetailToBenefit < ActiveRecord::Migration[7.0]
  def change
    add_reference :benefits, :emp_detail, null: false, foreign_key: true
  end
end
