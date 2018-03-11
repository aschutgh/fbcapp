class FriendshipsController < ApplicationController
before_action :authenticate_user!


  def index
    @users = User.all
  end


  def create
    user = User.find(params[:friend_id])
    current_user.befriend(user)
    user.befriend(current_user)
    redirect_to user_friendships_path(current_user)
  end

  def destroy
    user = Friendship.find(params[:id]).friend
    current_user.defriend(user)
    user.defriend(current_user)
    redirect_to user_friendships_path(current_user)
  end
end
