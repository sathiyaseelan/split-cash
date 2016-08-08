class Group < ApplicationRecord

    has_many :members, :dependent => :destroy
    has_many :expenses, :dependent => :destroy
    has_many :users, through: :members
    validates :name, presence: true
    validates :description, presence: true
    def moderators
      members.select {|member| member.role == 'moderator'}
    end

    def self.member_names_with_ids(group_id)
      Group.includes(:members, :users).find(group_id).users.pluck(:first_name, :last_name, :id).map{|x| [x.first << ", " << x[1]] << x.last }
    end

    def add_member(user)
      Member.create(group_id: self.id, user_id: user.id, role: :member)
    end

    def add_moderator(user)
      Member.create(group_id: self.id, user_id: user.id, role: :moderator)
    end

    def remove_member(user)
        Member.where(user: user, group: self, role: :member).first.destroy
    end

    def remove_moderator!(user)
        if Member.where(group: self, role: :moderator).size > 1
          Member.where(user: user, group: self, role: :moderator).first.destroy
        else
            raise 'Cannot delete..Only one moderator is available!'
        end
    end

    def remove_moderator(user)
      begin
        remove_moderator!(user)
        return true
      rescue
        return false
      end
    end
end
