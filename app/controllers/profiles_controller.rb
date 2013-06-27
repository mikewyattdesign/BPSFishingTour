class ProfilesController < ApplicationController
    before_action :set_profile, only: [:update, :destroy]

    # GET /profiles
    def index
        @profiles = Profile.all
    end

    # GET /profiles/1
    def show
        @profile = Profile.find(params[:id])
        @user = @profile.user
        @teammate = @user.teammate
        @team = @user.my_team
        redirect_to my_profile_path if user_signed_in? && @profile.id == current_user.profile.id
        @can_register = @profile.user.teams.size > 0
        @is_current_user = false
    end

    def show_current
        @user = current_user
        @teammate = @user.teammate
        @can_register = current_user.teams.size > 0
        current_user.create_profile unless current_user.profile
        @profile = current_user.profile
        @team = current_user.teams.first
        @is_current_user = true
    end

    # GET /profiles/new
    def new
        @profile = Profile.new
    end

    # GET /profiles/1/edit
    def edit
        @profile = current_user.profile
    end

    def select_profile_pic
        @profile = current_user.profile
    end

    def upload_profile_pic
        @profile = current_user.profile
        @profile.attributes = profile_params
        if @profile.save(validate: false)
            redirect_to my_profile_path, notice: "Your Profile picture has been uploaded!"
        else
            flash.clear
            flash.now[:notice] = "Uh oh! There seems to be an issue with uploading your image!"
            render :select_profile_pic
        end
    end

    # POST /profiles
    def create
        @profile = Profile.new(profile_params)
        @profile.user_id = current_user.id

        if @profile.save
            redirect_to requests_new_path, notice: 'Thanks for creating your profile, go ahead and set up a team!'
        else
            render action: 'new'
        end
    end

    # PATCH/PUT /profiles/1
    def update
        @team = current_user.teams.first
        if @profile.update(profile_params)
            if @team.nil?
                redirect_to requests_new_path
            else
                redirect_to @profile, notice: 'Profile was successfully updated.'
            end
        else
            if(current_user.teams.size > 0)
                @can_register = true
            else
                @can_register = false
            end

            path = URI::parse(request.referrer).path
            @showTab = true
            flash.now[:error] = "We could not update your profile!"

            if path == "/myprofile"
                render action: 'show_current'
            else
                render action: 'edit'
            end
        end
    end

    # DELETE /profiles/1
    def destroy
        @profile.destroy
        redirect_to profiles_url
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_profile
            @profile = Profile.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def profile_params
            params.require(:profile).permit(:user_id, :first_name, :last_name, :street_address, :suite, :city, :state, :zip, :phone, :ext, :shirt, :picture, :outdoor_rewards_number, :status)
        end
end
