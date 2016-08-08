class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :description, presence: :true
  validates :amount, presence: :true, length:{minimum: 1}
  validates :group, presence: :true
  validates :user, presence: :true
  after_save :update_dues


  private

  def update_dues
    ExpensesHelper::update_member_dues(self)
  end

end
