class UsersController < ApplicationController
    
    def mygroups
        @groups = current_user.groups
    end
    
    def search
        render 'find_user'
    end
end