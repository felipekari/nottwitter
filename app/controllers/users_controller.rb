class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @tweets = Tweet.where(user_id: params[:id]).order(created_at: :desc).page(params[:page])
    end
end