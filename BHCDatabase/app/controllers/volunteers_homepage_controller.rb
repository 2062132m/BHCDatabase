class VolunteersHomepageController < ApplicationController
  skip_before_action :admin_only
  before_action :volunteer_only

  def index
    @service_requests_grid = ServiceRequestsGrid.new(params[:service_requests_grid]) do |scope|
      scope.where(:user_id => current_user)
    end
    @service_requests = ServiceRequest.exists?(user_id: current_user)
  end
end
