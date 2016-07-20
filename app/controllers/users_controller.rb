class UsersController < ApplicationController

    def mygroups
#      @groups = current_user.groups
    end

    def search
      search_param = params[:search_param]
      @users = User.find_users(search_param)
      render partial: 'users/lookup'
    end
=begin
    def search
      if params[:search_param] == nil || params[:search_param] == ''
        render :json => {error: 'Missing Search Parameter'},
        status: 404
      else
        search_param = params[:search_param]
        users = User.find_users(search_param)
        render :json => users, status: :ok
      end
    end
=end

end
