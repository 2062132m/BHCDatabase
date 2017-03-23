class HomepageController < ApplicationController
  skip_before_action :admin_only
  before_action :redirect

  def index
    @areas = Area.where(:archived => false)
    @service_requests_grid = ServiceRequestsGrid.new(params[:service_requests_grid]) do |scope|
      scope.page(params[:page])
    end

    @max_init = Initiative.first
    max_init_count = 0
    Initiative.find_each do |init|
      if init.users.count > max_init_count
        max_init_count = init.users.count
        @max_init = init
      end
    end

    @max_condition = MedicalCondition.first
    max_condition_count = 0
    MedicalCondition.find_each do |cond|
      if cond.users.count > max_condition_count
        max_condition_count = cond.users.count
        @max_condition = cond
      end
    end

    min_init_count = max_init_count
    @min_initiative = Initiative.first
    Initiative.find_each do |init|
      if init.users.count < min_init_count
        min_init_count = init.users.count
        @min_initiative = init
      end
    end

    min_condition_count = max_condition_count
    @min_condition = MedicalCondition.first
    MedicalCondition.find_each do |cond|
      if cond.users.count < min_condition_count
        min_condition_count = cond.users.count
        @min_condition = cond
      end
    end
  end

  private

  # redirect routes a user to their own homepage when the log in
  def redirect
    redirect_to volunteershome_url if current_user.volunteer?
    redirect_to serviceusershome_url if current_user.service_user?
    show_browser_alert
  end
end
