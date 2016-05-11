require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
    
  test "can't create friendship without user id" do
    assert_raises(Exception) { Friendship.create! friend_id: 1}
  end
  
  test "can't create friendship without friend id" do
    assert_raises(Exception) { Friendship.create! user_id: 1}
  end
  
  test "can create a friendship with a user id and friend id" do
    assert Friendship.create! [{ user_id: 1, friend_id: 2 }]
  end
  
  test "default friendship status should be pending" do
    Friendship.create! [{ user_id: 1, friend_id: 2 }]
    friendship = Friendship.find_by_user_id(1)
    assert friendship.pending?, "Status wasn't pending, was #{friendship.status}" 
  end
  
end
