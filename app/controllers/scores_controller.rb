class ScoresController < ApplicationController
  layout 'bare'

  before_action :set_score, only: [:show, :edit, :update, :destroy]

  # GET /scores
  # GET /scores.json
  def index
    @scores = Score.all
    @events = Event.all
    @events_with_scores = @events.reject { |event| @scores.where(event_id: event.id).empty? }
    @profiles = Profile.all
  end

  # GET /scores/1
  # GET /scores/1.json
  def show
  end

  # GET /scores/new
  def new
    @score = Score.new
    @events = Event.all
  end

  # GET /scores/1/edit
  def edit
    @events = Event.all
  end

  # POST /scores
  # POST /scores.json
  def create
    @score = Score.new(score_params)

    respond_to do |format|
      if @score.save
        format.html { redirect_to @score, notice: 'Score was successfully created.' }
        format.json { render action: 'show', status: :created, location: @score }
      else
        format.html { render action: 'new' }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scores/1
  # PATCH/PUT /scores/1.json
  def update
    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to @score, notice: 'Score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy
    @score.destroy
    respond_to do |format|
      format.html { redirect_to scores_url }
      format.json { head :no_content }
    end
  end

  def import
    Score.import(params[:file], params[:event])
    redirect_to scores_path, notice: 'Added scores'
  end

  def angler
    Score.update params[:id], angler_id: params[:angler_id]
    redirect_to scores_path, notice: "Angler set to #{User.find(params[:angler_id]).full_name}"
  end

  def co_angler
    Score.update params[:id], co_angler_id: params[:co_angler_id]
    redirect_to scores_path, notice: "Co-Angler set to #{User.find(params[:co_angler_id]).full_name}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.require(:score).permit(:event_id, :position, :angler, :angler_rewards, :co_angler, :co_angler_rewards, :weight, :bf, :hp)
    end
end
