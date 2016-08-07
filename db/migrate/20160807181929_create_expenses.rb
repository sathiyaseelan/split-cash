class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.text :description
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.decimal :amount
      t.string :category
      t.date :paid_on

      t.timestamps
    end
  end
end
