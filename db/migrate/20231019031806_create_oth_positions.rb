class CreateOthPositions < ActiveRecord::Migration[7.0]
  def change
    create_table :oth_positions do |t|
      t.string :pos_title
      t.integer :pos_yr
      t.string :pos_month

      t.timestamps
    end
  end
end
