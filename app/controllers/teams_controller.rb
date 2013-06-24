class TeamsController < ApplicationController
    def index
    end

    def create
        render :text => params
    end

    def invite_teammate
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

    def update
        @team = Team.find(params[:id])
        @team.update_attributes(team_params)
        respond_to do |format|
            format.html
            format.json { render json: @team }
        end
    end

    def select_profile_pic
        @team = current_user.teams.first

    end

    def upload_team_pic
        @team = current_user.teams.first
        @team.attributes = team_params
        if @team.save(validate: false)
          redirect_to my_profile_path, notice: "Your Team Picture has been uploaded!"
        else
          flash.clear
          flash.now[:notice] = "Uh oh! There seems to be an issue with uploading your image!"
          render :select_team_pic
        end
    end

    def team_params
      params.require(:team).permit(:team_picture, :favorite_gear, :boat_description)
    end
end
