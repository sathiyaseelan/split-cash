class Member < ApplicationRecord
  belongs_to :user
  belongs_to :group

  def is_moderator?
    role == :moderator
  end

  def is_member?
    role == :member
  end

end
