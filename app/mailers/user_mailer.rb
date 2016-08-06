class UserMailer < ApplicationMailer
  default from: 'notifications@split-cash.com'

  def welcome_email(user)
    @user = user
    @url  = ENV['HOST_NAME']
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
