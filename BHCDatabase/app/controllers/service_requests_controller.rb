class ServiceRequestsController < ApplicationController
  def show
    @service_request = ServiceRequest.find(params[:id])
  end

  def new
    @user = @current_user
    @service_request = ServiceRequest.new
    end

  def create
    @user = @current_user
    @service_request  = ServiceRequest.new(service_request_params)

  end



  def service_request_params
    params.require(:service_request).permit(:user_id, :request)
  end


end
