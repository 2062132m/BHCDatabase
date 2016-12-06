class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :require_login, :except => :contact

  private

  def require_login
    unless current_user
      redirect_to login_path
      flash[:danger] = "Please log in."
    end
  end

end
