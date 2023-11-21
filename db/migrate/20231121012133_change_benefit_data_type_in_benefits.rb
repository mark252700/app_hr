class ChangeBenefitDataTypeInBenefits < ActiveRecord::Migration[7.0]
  def change
    change_column :benefits, :benefit, :text
  end
end
