require 'test_helper'

class GroupTest < ActiveSupport::TestCase

  setup do
    @group = groups(:group1)
  end

  test "should be able to create a group" do
    group = Group.new(name: 'test group', description: 'test group')
    assert group.save
  end

  test "should be able to list the members in the group" do
    assert_not_empty @group.members
  end

  test "should be able to list the moderators in the group" do
    assert_not_empty @group.members
  end

  test "should be able to delete the group" do
    assert @group.destroy
  end

  test "deleting group should delete the members also" do
    @group.destroy
    assert_empty @group.members
  end


end
