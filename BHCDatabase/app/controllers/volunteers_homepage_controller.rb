class VolunteersHomepageController < ApplicationController

  skip_before_action :admin_only
  before_action :volunteer_only

  def index
    @user = User.find(@current_user.id)
  end
end
