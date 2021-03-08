class FollowersController < ApplicationController
    before_action :find_user
    before_action :find_follower, only: [:destroy]

    def create
        if already_followed?
            flash[:notice] = "No puedes dar seguir a alguien mas de una vez"
        else
            @user.followers.create(follower_id: current_user.id)
        end
        redirect_to(@user)
    end

    def destroy
        if ! (already_followed?)
            flash[:notice] = "No sigues a este usuario"
        else
            @follower.destroy
        end
        redirect_to(@user)
    end

    private

    def find_user
        @user = User.find(params[:user_id])
    end

    def already_followed?
        Follower.where(user_id: params[:user_id], follower_id:
        current_user.id).exists?
    end

    def find_follower
        @follower = @user.followers.find(params[:id])
    end
end