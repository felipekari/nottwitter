class PagesController < ApplicationController
  def home
    @tweets = Tweet.all.limit(50).order(created_at: :desc)
  end
end
