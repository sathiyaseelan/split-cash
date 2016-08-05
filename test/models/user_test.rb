require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save user without email" do
    user = User.new(first_name: "test", last_name: 't')
    assert_not user.save
    assert_difference 'User.count',0, "User count is increased" do
    end
  end

  test "Should not allow to save user without first_name and last name" do
    user = User.create(email: 'test_user2@split-cash.com', password: 'password',confirmed_at: Time.now)
    assert_not user.save, "Saved without first name and last name"
  end

  test "should not save duplicate email id" do
    user = User.create(email: users(:test_user1).email, password: 'password', confirmed_at: Time.now)
    assert_not user.save
  end
end
