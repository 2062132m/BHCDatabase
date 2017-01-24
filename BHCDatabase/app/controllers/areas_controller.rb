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
  end

  def new
  end
end

class AreasGrid

  include Datagrid

  scope do
    Area
  end

  column(:id, :mandatory => true)
  column(:name, :mandatory => true)
  column(:description, :mandatory => true)

end
