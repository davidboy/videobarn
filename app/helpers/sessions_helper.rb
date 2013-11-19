module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))

    self.current_user = user
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def authorize
    unless signed_in?
      session[:return_to] = request.url if request.get?
      redirect_to signin_url
    end
  end

  def redirect_back_or_to(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def require_admin
    raise_404 unless current_user.is_admin?
  end

  def require_mod
    raise_404 unless current_user.is_mod?
  end

  private

    def raise_404
      raise ActionController::RoutingError.new('Not Found')
    end
end
