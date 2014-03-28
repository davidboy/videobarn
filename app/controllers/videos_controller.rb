require 'pathname'
require 'json'

class VideosController < ApplicationController
  before_action :require_admin, except: :bad
  before_action :require_mod, only: :bad
  before_action :set_video, only: [:show, :edit, :update, :destroy, :bad]

  skip_before_action :verify_authenticity_token, if: :json_request?

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
  end

  # GET /videos/1/edit
  def edit
  end

  def bad
    @video.mark_as_bad
    redirect_to new_run_path
  end

  # POST /videos
  # POST /videos.json
  def create
    new_videos = JSON.parse(params[:log])
    for vid in new_videos
      path, uuid = *vid
      source, original_name = *Pathname.new(path).each_filename.to_a

      puts "#{uuid}: '#{original_name}' from '#{source}'"
      Video.create(uuid: uuid, original_name: original_name, source: source, has_webm: true, has_mp4: true)
    end

    render text: 'Done'
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:run_id, :uuid, :notes)
    end

    def json_request?
      request.format.json?
    end
end
