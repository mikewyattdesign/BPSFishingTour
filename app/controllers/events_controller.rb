class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  def index
    @events = Event.order('date')
    @divisions = Division.all
  end

  # GET /events/1
  def show
    if(current_user.teams.size > 0 && current_user.teammate)
      @can_register = true
    else
      @can_register = false
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def register_event
    event = Event.find params[:id]
    if !current_user.my_team.events.include? event
      current_user.my_team.events << event
      flash[:register_event] = "Your team is now registered to participate in #{event.name}!"
      #Email them Here
      RegisterEventMailer.event_registered(event, current_user).deliver
    else
      flash[:alreay_registered_event] = "Your team is already registered to attend this event!"
    end
    redirect_to my_profile_path
  end

  def unregister_event
    event = Event.find params[:id]
    current_user.my_team.events.delete(event)
    flash[:unregister_event] = "Your team is now unregistered from #{event.name}!"
    redirect_to my_profile_path
  end

  # PATCH/PUT /events/1
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :address, :address2, :city, :province, :state, :country, :start_date, :end_date)
    end
end
