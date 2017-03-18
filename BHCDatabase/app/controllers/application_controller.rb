class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

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

  # Following three functions allow the blocking of pages to users who don't have the required privilege level
  def service_user_only
    unless current_user.service_user?
      flash[:danger] = 'You are not allowed to access that page.'
      redirect_to current_user
    end
  end

  def volunteer_only
    unless current_user.volunteer?
      flash[:danger] = 'You are not allowed to access that page.'
      redirect_to current_user
    end
  end

  def admin_only
    unless current_user.admin?
      flash[:danger] = 'You are not allowed to access that page.'
      redirect_to current_user
    end
  end

  # Calls a method at .self to check if archived
  def archive_redirect
    if self.am_i_archived?
      if current_user.admin?
        flash[:info] = 'This page has been archived.'
      else
        flash[:danger] = 'Sorry, this page no longer exists.'
        redirect_to :back
      end
    end
  end
end
