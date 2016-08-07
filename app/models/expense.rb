class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :description, presence: :true
  validates :amount, presence: :true, length:{minimum: 1}
  validates :group, presence: :true
  validates :user, presence: :true
end
