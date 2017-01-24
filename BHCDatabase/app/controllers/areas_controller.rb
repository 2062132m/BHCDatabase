class AreasController < ApplicationController

  def index
    @areas = Area.all
  end

  def show
    @area = Area.find(params[:id])
    @initiatives = Initiative.where(area_id: @area)
  end

  def new
  end
end
