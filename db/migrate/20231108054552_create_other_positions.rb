class CreateOtherPositions < ActiveRecord::Migration[7.0]
  def change
    create_table :other_positions do |t|
      t.string :pos_title
      t.integer :pos_yr
      t.integer :pos_month

      t.timestamps
    end
  end
end
