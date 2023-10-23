class AddOthPerformedToNestedOthperforme < ActiveRecord::Migration[7.0]
  def change
    add_reference :nested_othperformes, :oth_performed, null: false, foreign_key: true
  end
end
