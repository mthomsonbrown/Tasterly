class UsersController < ApplicationController
  def index
    @friends = User.friendable current_user.id
  end
end
