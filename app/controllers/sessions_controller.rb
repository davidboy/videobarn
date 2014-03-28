class SessionsController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]

  def new
    redirect_to Show.first if signed_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or_to Show.first
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to signin_url
  end
end
