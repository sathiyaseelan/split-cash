module ExpensesHelper

  def self.update_member_dues(expense)
    group = Group.includes(:members).find(expense.group_id)
    per_member_share = expense.amount / group.members.size
    group.members.each do |member|
      unless member.user_id == expense.user_id
        member.due_amount += per_member_share
        member.save
      end
    end
  end
end
