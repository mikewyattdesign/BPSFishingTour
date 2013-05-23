class TeamsController < ApplicationController
    def index
    end

    def create
        render :text => params
    end

    def invite_teammate
        @requester = current_user
        @user = User.find_by_email(params[:email])
        if @user
            TeammateInviteMailer.team_up(@user, params[:first_name], params[:last_name]).deliver
        else
            TeammateInviteMailer.sign_up_and_team_up(params[:first_name], params[:last_name], params[:email]).deliver
        end
    end
end
