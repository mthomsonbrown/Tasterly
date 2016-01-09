class UsersController < ApplicationController
  def index
    @friends = User.friendable current_user.id, current_user.friends
  end
end
