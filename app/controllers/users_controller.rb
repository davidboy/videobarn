class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      raise ActionController::RoutingError.new('Not Found')
    end

    @recent_videos = @user.video_views.order('id DESC').paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    unless params[:signup_token] == ENV['VIDEOBARN_SIGNUP_TOKEN']
      @user.errors.add(:signup_key_phrase, 'was incorrect.  Please try again.')
      render action: 'new'
      return
    end
    
    if @user.save
      sign_in @user
      flash[:success] = 'Welcome!'
      redirect_to @user, notice: 'User was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @user = current_user

    unless current_user?(current_user.authenticate(params[:old_password]))
      current_user.errors.add(:old_password, 'was incorrect.  Please try again.')
      render action: 'edit'
      return
    end

    if current_user.update(user_params)
      redirect_to root_path, notice: 'Your password was successfully changed.'
    else
      render action: 'edit'
    end
  end

  def edit
    @user = current_user
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :old_password, :password, :password_confirmation)
    end
end
