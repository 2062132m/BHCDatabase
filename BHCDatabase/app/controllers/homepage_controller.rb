class HomepageController < ApplicationController
  skip_before_action :admin_only
  before_action :redirect

  def index
    @areas = Area.where(:archived => false)
    @service_requests_grid = ServiceRequestsGrid.new(params[:service_requests_grid]) do |scope|
      scope.page(params[:page])
    end
    @initiatives = Initiative.all
    @conditions = MedicalCondition.all
    maxInitCount = 0
    maxConditionCount = 0
    @maxInit = @initiatives.first
    @maxCondition = @conditions.first
    @initiatives.each do |init|
      if init.users.count > maxInitCount
        maxInitCount = init.users.count
        @maxInit = init
      end
    end
    @conditions.each do |cond|
      if cond.users.count > maxConditionCount
        maxConditionCount = cond.users.count
        @maxCondition = cond
      end
    end
    minInitCount = maxInitCount
    minConditionCount = maxConditionCount
    @minInit = @initiatives.first
    @minCondition = @conditions.first
    @initiatives.each do |init|
      if init.users.count < minInitCount
        minInitCount = init.users.count
        @minInit = init
      end
    end
    @conditions.each do |cond|
      if cond.users.count < minConditionCount
        minConditionCount = cond.users.count
        @minCondition = cond
      end
    end
  end

  private

  # redirect routes a user to their own homepage when the log in
  def redirect
    redirect_to volunteershome_url if current_user.volunteer?
    redirect_to serviceusershome_url if current_user.service_user?
  end

end
