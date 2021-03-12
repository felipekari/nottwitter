class PagesController < ApplicationController
  def home
    if user_signed_in?
      @tweets = Tweet.tweets_for_me(current_user).order(created_at: :desc).page(params[:page])
    else
      @tweets = Tweet.all.order(created_at: :desc).page(params[:page])
    end
  end

  def discover
    if user_signed_in?
      @tweets = Tweet.tweets_discover(current_user).order(created_at: :desc).page(params[:page])
    else
      @tweets = Tweet.all.order(created_at: :desc).page(params[:page])
    end
  end
end
