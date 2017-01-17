class HomepageController < ApplicationController

  def index
    @areas = Area.all
  end
end
