class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  before_filter :create_navbar_items
  before_filter :authorize

  private

  def create_navbar_items
    @nav_items = {
      shows: Show.all,
      classes: Category.all,
      riders: Rider.all
    }
  end
end
