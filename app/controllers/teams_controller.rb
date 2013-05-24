class TeamsController < ApplicationController
    def index
    end

    def create
        render :text => params
    end

    def invite_teammate
        
        @user = User.find_by_email(params[:email])
        if @user
            TeammateInviteMailer.sign_up_and_team_up(@user, params[:first_name], params[:last_name], current_user).deliver
            flash[:notice] = "Your request has been sent to your teammate. If #{params[:first_name]} #{params[:last_name]} accepts, you may eneter a tournament."
            redirect_to '/'
        else
            TeammateInviteMailer.sign_up_and_team_up(params[:first_name], params[:last_name], params[:email], current_user).deliver
                flash[:notice] = "Your request has been sent to your teammate. If #{params[:first_name]} #{params[:last_name]} accepts, you may eneter a tournament."
                redirect_to '/'
        end
    end
end
