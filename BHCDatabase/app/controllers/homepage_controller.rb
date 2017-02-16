class HomepageController < ApplicationController

  skip_before_action :admin_only
  before_action :redirect

  def index
    @areas = Area.all
  end

  private

  def redirect
    if volunteer?
      redirect_to volunteershome_path
    end
  end

end
