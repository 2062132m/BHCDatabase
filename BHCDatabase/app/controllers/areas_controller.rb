class AreasController < ApplicationController

  def index
    @areas = Area.all
    @areas_grid = AreasGrid.new(params[:areas_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def show
    @area = Area.find(params[:id])
    @initiatives = Initiative.where(area_id: @area)
    @initiatives_in_area_grid = InitiativesInAreaGrid.
    new(params[:initiatives_in_area_grid]) do |scope|
      scope.where(:area_id => @area).page(params[:page])
    end
    @initiatives_in_area_grid.assets
  end

  def new
  end
end
