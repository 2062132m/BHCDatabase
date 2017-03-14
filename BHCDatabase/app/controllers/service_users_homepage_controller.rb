class ServiceUsersHomepageController < ApplicationController
  skip_before_action :admin_only
  before_action :service_user_only

  def index
    @user = User.find(@current_user.id)
  end
end
