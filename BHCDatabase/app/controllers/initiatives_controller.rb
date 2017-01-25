class InitiativesController < ApplicationController

  def index
    @initiatives = Initiative.all
    @initiatives_grid = InitiativesGrid.new(params[:initiatives_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def show
    @initiative = Initiative.find(params[:id])
    @area = Area.find(@initiative.area_id)
    @meetings = Meeting.where(initiative_id: @initiative)
  end

  def new
  end
end

class InitiativesGrid

  include Datagrid

  scope do
    Initiative
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
  column(:location, :mandatory => true)
  column(:description, :mandatory => true)

end
