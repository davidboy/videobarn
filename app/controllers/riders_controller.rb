class RidersController < ApplicationController
  before_action :require_mod, except: :show
  before_action :set_rider, only: [:show, :edit, :update, :destroy]

  # GET /riders
  # GET /riders.json
  def index
    @riders = Rider.all
  end

  # GET /riders/1
  # GET /riders/1.json
  def show
    @shows = @rider.shows.order('date DESC').uniq

    if params[:show_id]
      @show = Show.find(params[:show_id])
      @runs = @rider.runs.where(show: @show)
      session[:playlist_name] = "#{@rider.name} at #{@show.name}"
    else
      @runs = @rider.runs
      session[:playlist_name] = @rider.name
    end

    if params[:horse] and params[:horse] != ''
      @horse = Horse.find(params[:horse])
      @runs = @runs.where(horse: @horse)
      session[:playlist_name] += "on #{@horse.name}"
    end

    @runs = @runs.paginate(page: params[:page])

    session[:playlist] = @runs.pluck(:id)
  end

  # GET /riders/new
  def new
    @rider = Rider.new
  end

  # GET /riders/1/edit
  def edit
  end

  # POST /riders
  # POST /riders.json
  def create
    @rider = Rider.new(rider_params)

    respond_to do |format|
      if @rider.save
        format.html { redirect_to @rider, notice: 'Rider was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rider }
      else
        format.html { render action: 'new' }
        format.json { render json: @rider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /riders/1
  # PATCH/PUT /riders/1.json
  def update
    respond_to do |format|
      if @rider.update(rider_params)
        format.html { redirect_to @rider, notice: 'Rider was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /riders/1
  # DELETE /riders/1.json
  def destroy
    @rider.destroy
    respond_to do |format|
      format.html { redirect_to riders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rider
      @rider = Rider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rider_params
      params.require(:rider).permit(:name, :fav, :notes)
    end
end
