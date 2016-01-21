class UsersController < ApplicationController
  def index
    @friends = User.friendable current_user.id
    puts "Friends size == #{User.find(current_user).friends.size}"
  end
end
