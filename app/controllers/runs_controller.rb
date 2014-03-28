class RunsController < ApplicationController
  before_action :require_mod, except: [:show, :random, :search]
  before_action :set_run, only: [:show, :edit, :update, :destroy]

  # GET /runs
  # GET /runs.json
  def index
    @runs = Run.all
  end

  def search
    Search.create(user: current_user, query: params[:query], searched_on: Time.now)

    tags = params[:query].split(' ')
    @runs = Run.tagged_with(tags).paginate(page: params[:page])
    session[:playlist] = @runs.pluck(:id)
    session[:playlist_name] = "Search results for #{params[:query]}"
  end

  # GET /runs/1
  # GET /runs/1.json
  def show
    VideoView.create(video: @run.video, user: current_user, viewed_on: Time.now)

    unless @run.video.has_webm? and @run.video.has_mp4?
      render text: 'Run not processed.'
    end

    if playlist = session[:playlist] and playlist.is_a? Array
      current_location = playlist.index(params[:id].to_i) || 0

      @next_video = playlist[current_location+1] || playlist.first
      @previous_video = playlist[current_location-1]
    else
      @next_video = 'random'
      @previous_video = 'random'
      session[:playlist_name] = 'None (using random videos)'
    end
  end

  def random
    session[:playlist] = 'random'
    session[:playlist_name] = 'Random videos'
    redirect_to Run.first(offset: rand(Run.count))
  end

  # GET /runs/new
  def new
    if Video.unlabeled.any?
      @run = Run.new
      @run.video = Video.unlabeled.first
    else
      render text: 'No more videos to process!'
    end
  end

  # GET /runs/1/edit
  def edit
  end

  # POST /runs
  # POST /runs.json
  def create
    @run = Run.new(run_params)
    @run.video = Video.find(params[:video_id])

    respond_to do |format|
      if @run.save
        format.html { redirect_to @run, notice: 'Run was successfully created.' }
        format.json { render action: 'show', status: :created, location: @run }
      else
        format.html { render action: 'new' }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /runs/1
  # PATCH/PUT /runs/1.json
  def update
    respond_to do |format|
      if @run.update(run_params)
        format.html { redirect_to @run, notice: 'Run was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runs/1
  # DELETE /runs/1.json
  def destroy
    @run.destroy
    respond_to do |format|
      format.html { redirect_to runs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run
      @run = Run.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def run_params
      params.require(:run).permit(:show_id, :rider_id, :horse_id, :show_class_id, :time, :placing, :penalty, :fav, :notes)
    end
end
