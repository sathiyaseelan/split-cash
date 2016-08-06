require 'test_helper'

class MemberTest < ActiveSupport::TestCase

  setup do
    @user1 = users(:user1)
    @user2 = users(:user2)
    @user3 = users(:user3)
    @user4 = users(:user4)

    @group1 = groups(:group1)
    @group2 = groups(:group2)
  end

  test "should be able to add members to the existing group" do
    assert_difference '@group1.members.count', 1 do
      @group1.members << Member.new(group: @group1, user: @user4, role: :member)
    end
  end

end
