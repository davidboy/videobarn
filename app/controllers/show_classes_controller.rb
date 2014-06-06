class ShowClassesController < ApplicationController
  before_action :require_admin
  before_action :set_show_class, only: [:show, :edit, :update, :destroy]

  # GET /show_classes
  def index
    @show_classes = ShowClass.all
  end

  # GET /show_classes/1
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
  def create
    @show_class = ShowClass.new(show_class_params)

    if @show_class.save
      redirect_to @show_class, notice: 'Show class was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /show_classes/1
  def update
    if @show_class.update(show_class_params)
      redirect_to @show_class, notice: 'Show class was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /show_classes/1
  def destroy
    @show_class.destroy
    redirect_to show_classes_url
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
