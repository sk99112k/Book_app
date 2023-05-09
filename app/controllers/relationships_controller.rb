class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    #request.refere
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
    #redirect_to request.referer
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  def followeds
    user = User.find(params[:user_id])
    @users = user.followeds
  end

end
