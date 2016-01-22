require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup 
    @user = User.find(1)  
  end
  
  test "can add user" do
    user = User.create! email: "new@user.com", password: "qwertyui", password_confirmation: "qwertyui", username: "newUser"
    assert user.username == "newUser"
  end
  
  test "test user 1 is created and returns correct username" do
    assert @user.username == "test1"
    assert User.find_by_email("test1@test.com").username == "test1"
  end
  
  test "can create friendsips with array" do 
    assert @user.friendships.size == 0
    assert @user.friendships.create! [{:friend_id => 2}, {:friend_id => 3}]
    assert @user.friendships.size == 2
  end
  
  # Continue changing these main user instances to instance variables, but decide what to move to the friendship_test module first.  Testing one model inside another breaks modularity
  test "can get friend's id" do
    user = User.find(1)
    user.friendships.create! friend_id: 2
    assert user.friendships.find(1).friend_id == 2, "Friendship doesn't have a friend id"
    assert User.find(user.friendships.find(1).friend_id).email == "test2@test.com"
  end
  
  test "can get friend's name" do
    user = User.find(1)
    user.friendships.create! friend_id: 2
    friend = user.friendships.find(1).friend_id
    user2 = User.find(friend)
    assert user2.username = "test2"
  end
  
  test "can add friendships" do
    user = User.find_by_email("test1@test.com")
    assert user.friendships.size == 0
    user.friendships.create! friend_id: 2
    assert user.friendships.size == 1
  end
  
  test "can't add friendship with friend id that is not a user id" do
    bogus = 42
    user = User.find(1)
    assert user.friendships.size == 0
    assert_raises(Exception) { user.friendships.create! friend_id: bogus }
    assert user.friendships.size == 0, "frienship size wasn't 0, was #{user.friendships.size}"
  end
  
  test "Can return list of friend ids" do
    user = User.find(1)
    assert_not User.friend_ids(1).include?(2)
    user.friendships.create! friend_id: 2
    assert User.friend_ids(1).include?(2)
  end
  
  test "can create beer" do
    # user should be made with FactoryGirl?  I have this query in every test...
    user = User.find_by_email("test1@test.com")
    
    assert user.beers.size == 0
    assert user.beers.create! name: "very good beer"
    assert user.beers.size == 1
    assert user.beers.find_by(name: "very good beer").name == "very good beer"
  end
end
