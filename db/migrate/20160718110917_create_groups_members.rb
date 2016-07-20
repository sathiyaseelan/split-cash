class CreateGroupsMembers < ActiveRecord::Migration[5.0]
  def change

    create_table :groups do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :members do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.string :role
      t.timestamps
    end

  end
end
