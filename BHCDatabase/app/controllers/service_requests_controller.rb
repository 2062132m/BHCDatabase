class ServiceRequestsController < ApplicationController
  skip_before_action :admin_only
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
    if @service_request.save
      flash[:success] = 'Created a new service request!'
      redirect_to @current_user
    else
      puts @service_request.valid?
      render 'new'

    end


  end
  def set_service_request
    @service_request = ServiceRequest.find(params[:id])
  end
  def service_request_params
    params.require(:service_request).permit(:@current_user, :request)
  end


end
