json.extract! expense, :id, :description, :user_id, :group_id, :amount, :category, :paid_on, :created_at, :updated_at
json.url expense_url(expense, format: :json)