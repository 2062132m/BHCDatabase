class HomepageController < ApplicationController
  skip_before_action :admin_only
  before_action :redirect

  def index
    @areas = Area.all
    @service_requests_grid = ServiceRequestsGrid.new(params[:service_requests_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  private

  # redirect routes a user to their own homepage when the log in
  def redirect
    redirect_to volunteershome_url if volunteer?
    redirect_to serviceusershome_url if service_user?
  end

end
