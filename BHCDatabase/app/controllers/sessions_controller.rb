class SessionsController < ApplicationController
  skip_before_action :require_login, :admin_only

  def new
    if logged_in?
      redirect_to root_url
      flash[:info] = 'You are already logged in.'
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to login_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
