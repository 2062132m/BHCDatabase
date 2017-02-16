class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :require_login, :except => :contact
  before_action :admin_only, :except => :contact

  private

  def require_login
    unless current_user
      redirect_to login_path
      flash[:danger] = 'Please log in.'
    end
  end

  def redirect_if_service_user
    unless @current_user.privilege == 0
      if @current_user != User.find(params[:id])
          flash[:danger] = 'You are not allowed to access that page.'
          redirect_to current_user
      end
    end
  end

  def service_user_only
    unless @current_user.privilege == 2
      flash[:danger] = 'You are not allowed to access that page.'
      redirect_to current_user
    end
  end

  def volunteer_only
    unless @current_user.privilege == 1
      flash[:danger] = 'You are not allowed to access that page.'
      redirect_to current_user
    end
  end

  def admin_only
    unless @current_user.privilege == 0
      flash[:danger] = 'You are not allowed to access that page.'
      redirect_to current_user
    end
  end

  def service_user?
    @current_user.privilege == 2
  end

  def volunteer?
    @current_user.privilege == 1
  end

  def admin?
    @current_user.privilege == 0
  end

end
