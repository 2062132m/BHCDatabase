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

  def redirect
    unless admin?
      if volunteer?
        redirect_to volunteershome_path
      else service_user?
        redirect_to serviceusershome_path
      end
    end
  end

end
