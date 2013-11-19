class HorsesController < ApplicationController
  before_action :require_mod
  before_action :set_horse, only: [:show, :edit, :update, :destroy]

  # GET /horses
  # GET /horses.json
  def index
    @horses = Horse.all
  end

  # GET /horses/1
  # GET /horses/1.json
  def show
  end

  # GET /horses/new
  def new
    @horse = Horse.new
  end

  # GET /horses/1/edit
  def edit
  end

  # POST /horses
  # POST /horses.json
  def create
    @horse = Horse.new(horse_params)

    respond_to do |format|
      if @horse.save
        format.html { redirect_to @horse, notice: 'Horse was successfully created.' }
        format.json { render action: 'show', status: :created, location: @horse }
      else
        format.html { render action: 'new' }
        format.json { render json: @horse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horses/1
  # PATCH/PUT /horses/1.json
  def update
    respond_to do |format|
      if @horse.update(horse_params)
        format.html { redirect_to @horse, notice: 'Horse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @horse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horses/1
  # DELETE /horses/1.json
  def destroy
    @horse.destroy
    respond_to do |format|
      format.html { redirect_to horses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horse
      @horse = Horse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def horse_params
      params.require(:horse).permit(:name, :notes)
    end
end
