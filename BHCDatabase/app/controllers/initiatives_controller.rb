class InitiativesController < ApplicationController

  def index
    @initiatives = Initiative.all
  end

  def show
    @initiative = Initiative.find(params[:id])
    @area = Area.find(@initiative.area_id)
  end

  def new
  end
end
