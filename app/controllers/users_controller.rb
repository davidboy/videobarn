class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      raise ActionController::RoutingError.new('Not Found')
    end

    @recent_videos = @user.video_views.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = 'Welcome!'
      redirect_to @user, notice: 'User was successfully created.'
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
