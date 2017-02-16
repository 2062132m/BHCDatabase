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

  def service_user_only
    if current_user
      unless @current_user.privilege == 2
        flash[:danger] = 'You are not allowed to access that page.'
        redirect_to current_user
      end
    end
  end

  def volunteer_only
    if current_user
      unless @current_user.privilege == 1
        flash[:danger] = 'You are not allowed to access that page.'
        redirect_to current_user
      end
    end
  end

  def admin_only
    if current_user
      unless @current_user.privilege == 0
        flash[:danger] = 'You are not allowed to access that page.'
        redirect_to current_user
      end
    end
  end

  def service_user?
    if current_user
      if @current_user.privilege == 2
        # flash[:info] = 'You are a service user.'
      end
    end
  end

  def volunteer?
    if current_user
      if @current_user.privilege == 1
        # flash[:info] = 'You are a volunteer.'
      end
    end
  end

  def admin?
    if current_user
      if @current_user.privilege == 0
        # flash[:info] = 'You are an admin'
      end
    end
  end

end
