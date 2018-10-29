class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :login_required
  include SessionsHelper

  def login_required
    redirect_to login_path unless current_user
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end




  private

  def require_user_logged_in
    unless logged_in?
    redirect_to "/sessions/new", notice: "ログインしてください"
    end
  end

end
