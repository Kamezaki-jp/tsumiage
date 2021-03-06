class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def follow
    current_user.follow(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.following_user.order(created_at: :desc).page(params[:page]).per(15)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower_user.order(created_at: :desc).page(params[:page]).per(15)
  end
end
