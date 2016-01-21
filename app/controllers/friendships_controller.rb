class FriendshipsController < ApplicationController
    
    def create
        @friendship = current_user.friendships.create! friend_id: params[:friend_id]
        @friend = User.find(@friendship.friend_id)
        puts "Friend id is #{@friendship.friend_id}"
    end
end
