class Group < ApplicationRecord
    resourcify
    
    
    # Get the members in the group
    def members(roles = Role.group_roles)
        if roles.is_a? Array
            roles_arr = []
            roles.each { |role| roles_arr << {name: role, resource: self}}
            User.with_any_role(*roles_arr)
        else
            User.with_any_role({name: roles, resource: self})
        end
    end
    
    def add_member(user)
        unless user.has_role? :member, self
            user.add_role(:member, self)
        end
    end
    
    def add_moderator(user)
        unless user.has_role? :moderator, self
            user.add_role(:moderator, self)
        end
    end
    
    def remove_member(user)
        if user.has_role? :member, self
            user.revoke(:member, self)
        end
    end
    
    def remove_moderator(user)
        if members(:moderator).reject{|u| u==user}.count > 0
            user.revoke(:moderator, self)
        else
            raise 'Only one moderator is available'
        end
    end
end
