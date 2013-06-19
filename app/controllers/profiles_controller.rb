class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

    # GET /profiles/1
    # GET /profiles/1.json
    def show
        @profile = Profile.find(params[:id])
        @can_register = @profile.user.teams.size > 0
    end

    def show_current
        @can_register = current_user.teams.size > 0
        @profile = current_user.profile
    end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    respond_to do |format|
      if @profile.save
        format.html { redirect_to requests_new_path, notice: 'Thanks for creating your profile, go ahead and set up a team!' }
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        if(current_user.teams.size > 0)
          @can_register = true
        else
          @can_register = false
        end
        format.html {
          @showTab = true
          flash.now[:error] = "We could not update your profile!"
          render action: 'show'
        }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :first_name, :last_name, :street_address, :suite, :city, :state, :zip, :phone, :ext, :shirt)
    end
end
