class TeamsController < ApplicationController
    def index
    end

    def create
        render :text => params
    end

    def update
        @team = Team.find(params[:id])
        @team.update_attributes(team_params)
        respond_to do |format|
            format.html
            #format.json { render json: @team }

            #returns field update to best in place via AJAX
            format.json { respond_with_bip(@team) }
        end
    end

    def select_profile_pic
        @team = current_user.teams.first

    end

    def upload_team_pic
        @team = current_user.teams.first
        @team.attributes = team_params if params[:team]
        if @team.save(validate: false) && params[:team]
          redirect_to my_profile_path(:tab => 'team'), notice: "Your Team Picture has been uploaded!"
        else
          flash.clear
          flash.now[:notice] = "Uh oh! There seems to be an issue with uploading your image!"
          render :select_profile_pic
        end
    end

    def team_params
      params.require(:team).permit(:team_picture, :favorite_gear, :boat_description)
    end
end
