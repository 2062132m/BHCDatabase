class ServiceRequestsController < ApplicationController
  skip_before_action :admin_only

  def show
    @service_request = ServiceRequest.find(params[:user_id])
  end

  def new
    @user = @current_user
    @service_request = ServiceRequest.new
  end

  def create
    @user = @current_user
    @service_request = ServiceRequest.new(service_request_params)
    if @service_request.save
      flash[:success] = 'Created a new service request!'
      redirect_to @current_user
    else
      render 'new'
    end
  end

  def destroy
    flash[:success] = 'Service request deleted' if ServiceRequest.find(params[:id]).destroy
    redirect_to root_url
  end

  def service_request_params
    params.require(:service_request).permit(:user_id, :request)
  end


end
