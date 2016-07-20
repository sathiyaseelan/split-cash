class Member < User
    
    attr_accessor :group_id, :roles

    def get_roles_for_group(group_id)
        roles.select{|r| r.resource_id == @group.id}.pluck(:name)    
    end
    
end