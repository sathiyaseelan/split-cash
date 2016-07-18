class AlterUserColumns < ActiveRecord::Migration[5.0]
  def change
    ## Confirmable
      add_column :users, :confirmation_token, :string
      add_column :users, :confirmed_at, :datetime
      add_column :users, :confirmation_sent_at, :datetime
      add_column :users, :unconfirmed_email, :string
      
    ## Lockable
      add_column :users, :failed_attempts, :integer
      add_column :users, :unlock_token, :string
      add_column :users, :locked_at, :datetime
    
  end
end
