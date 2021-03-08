class PagesController < ApplicationController
  def home
    if user_signed_in?
      @tweets = Tweet.joins(:user, user: [:followers]).where(followers: { follower_id: current_user.id}).order(created_at: :desc).page(params[:page])
    else
      @tweets = Tweet.all.order(created_at: :desc).page(params[:page])
    end
  end
end
