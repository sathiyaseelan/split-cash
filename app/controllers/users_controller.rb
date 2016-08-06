class UsersController < ApplicationController

  def search
  end

  def lookup
    search_param = params[:search_param]
    @users = User.find_users(search_param).page params[:page]
    render partial: 'users/lookup'
  end

end
