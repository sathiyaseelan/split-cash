class UsersController < ApplicationController
    
    def mygroups
        @groups = current_user.groups
    end
end