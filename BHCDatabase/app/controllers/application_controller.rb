class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  Groupdate.time_zone = false

  # As this is in ApplicationController, all pages on the website require a login EXCEPT the contact page
  before_action :require_login, :except => :contact
  # Admin_Only here specifics that all pages, except contact, require a login to access. Where a service_user or
  #   a volunteer requires access, you must specifically skip_before_action this to allow access.
  before_action :admin_only, :except => :contact

  private

  def require_login
    unless current_user
      redirect_to login_path
      flash[:danger] = 'Please log in.'
    end
  end

  def correct_user_only
    unless admin?
      if @current_user != User.find(params[:id])
        flash[:danger] = 'You are not allowed to access that page.'
        redirect_to current_user
      end
    end
  end

  # Ensure that only a user enrolled for the particular initiative can access it
  def correct_initiative_only
    unless admin?
      if service_user?
        flash[:danger] = 'You are not allowed to access that page.'
        redirect_to current_user
      elsif !@current_user.initiatives.include?(Initiative.find(params[:id]))
        flash[:danger] = 'You are not allowed to access that page.'
        redirect_to current_user
      end
    end
  end


  def correct_initiative_only_on_creation
    unless admin?
      if service_user?
        flash[:danger] = 'You are not allowed to access that page. vag'
        redirect_to current_user
      elsif !@current_user.initiatives.include?(Initiative.find(params[:initiative_id]))
        flash[:danger] = 'You are not allowed to access that page Boobs.'
        redirect_to current_user
      end
    end
  end

  def service_user_only
    unless service_user?
      flash[:danger] = 'You are not allowed to access that page.'
      redirect_to current_user
    end
  end

  def volunteer_only
    unless volunteer?
      flash[:danger] = 'You are not allowed to access that page.'
      redirect_to current_user
    end
  end

  def admin_only
    unless admin?
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

  def is_archived
    if self.is_archived?
      if @current_user.privilege > 0
        flash[:danger] = 'Sorry, this page no longer exists.'
        redirect_to :back
        return
      end
      flash[:danger] = 'This page has been archived and is only visible to admins.'
    end
  end

end
