class AddDueAmountToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :due_amount, :decimal, default: 0.0, null: false
  end
end
