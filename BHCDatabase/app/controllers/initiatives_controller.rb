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

  column(:id, :mandatory => true)
  column(:name, :mandatory => true)
  column(:location, :mandatory => true)

end
