class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :require_login, :except => :contact
  before_action :user_only?, :volunteer_only?

  private

  def require_login
    unless current_user
      redirect_to login_path
      flash[:danger] = 'Please log in.'
    end
  end

  def user_only?
    if current_user
      if @current_user.privilege == 2
        flash[:danger] = 'You are only a user.'
        redirect_to contact_path
      end
    end
  end

  def volunteer_only?
    if current_user
      if @current_user.privilege == 1
        flash[:danger] = 'You are only a volunteer.'
        redirect_to contact_path
      end
    end
  end

  def admin?
    if current_user
      unless @current_user.privilege == 0
        # flash[:success] = 'You are not an admin!'
        redirect_to current_user
      end
    end
  end

end
