class Group < ApplicationRecord

    has_many :members
    has_many :users, through: :members
    
    def moderators
      members.select {|member| member.role == 'moderator'}
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
