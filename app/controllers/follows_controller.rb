class FollowsController < ApplicationController
    before_action :set_user, only: [:follow, :unfollow]
    def follow
        current_user.follow(@user)
        redirect_back(fallback_location: root_path)
    end

    def unfollow
        current_user.unfollow(@user)
        redirect_back(fallback_location: root_path)
    end

    private
    def set_user
        @user = User.find(params[:user_id])
    end
end