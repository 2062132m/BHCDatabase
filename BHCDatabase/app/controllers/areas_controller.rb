class AreasController < ApplicationController

  def index
    @areas = Area.all
    @areas_grid = AreasGrid.new(params[:areas_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def show
    $area = Area.find(params[:id])
    @initiatives = Initiative.where(area_id: $area)
    @initiatives_in_area_grid = InitiativesInAreaGrid.
    new(params[:initiatives_in_area_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def new
    @area = Area.new
  end
end

class AreasGrid

  include Datagrid

  scope do
    Area
  end

  filter(:condition, :dynamic, :header => "Filter")

  column(:id, :mandatory => true) do |model|
    format(model.id) do |value|
      link_to value, model
    end
  end
  column(:name, :mandatory => true) do |model|
    format(model.name) do |value|
      link_to value, model
    end
  end
  column(:description, :mandatory => true)

end

class InitiativesInAreaGrid < AreasController

  include Datagrid

  scope do
    Initiative.where(area_id: $area)
  end

  column(:id, :mandatory => true) do |model|
    format(model.id) do |value|
      link_to value, model
    end
  end
  column(:name, :mandatory => true) do |model|
    format(model.name) do |value|
      link_to value, model
    end
  end
  column(:location, :mandatory => true)

end
