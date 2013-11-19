class ShowClassesController < ApplicationController
  before_action :require_admin
  before_action :set_show_class, only: [:show, :edit, :update, :destroy]

  # GET /show_classes
  # GET /show_classes.json
  def index
    @show_classes = ShowClass.all
  end

  # GET /show_classes/1
  # GET /show_classes/1.json
  def show
  end

  # GET /show_classes/new
  def new
    @show_class = ShowClass.new
  end

  # GET /show_classes/1/edit
  def edit
  end

  # POST /show_classes
  # POST /show_classes.json
  def create
    @show_class = ShowClass.new(show_class_params)

    respond_to do |format|
      if @show_class.save
        format.html { redirect_to @show_class, notice: 'Show class was successfully created.' }
        format.json { render action: 'show', status: :created, location: @show_class }
      else
        format.html { render action: 'new' }
        format.json { render json: @show_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /show_classes/1
  # PATCH/PUT /show_classes/1.json
  def update
    respond_to do |format|
      if @show_class.update(show_class_params)
        format.html { redirect_to @show_class, notice: 'Show class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @show_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /show_classes/1
  # DELETE /show_classes/1.json
  def destroy
    @show_class.destroy
    respond_to do |format|
      format.html { redirect_to show_classes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show_class
      @show_class = ShowClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_class_params
      params.require(:show_class).permit(:name, :category_id)
    end
end
