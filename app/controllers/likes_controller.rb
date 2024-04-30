class LikesController < ApplicationController
    before_action :set_twit

    def toggle_like
        if(@like = @twit.likes.find_by(user: current_user))
            @like.destroy
        else
            @twit.likes.create(user: current_user)
        end
    end

    private
    def set_twit
        @twit = Twit.find(params[:twit_id])
    end
end