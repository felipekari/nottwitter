class PagesController < ApplicationController
  def home
    @tweets = Tweet.all.order(created_at: :desc).page(params[:page])
  end
end
