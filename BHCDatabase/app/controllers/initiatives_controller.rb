class InitiativesController < ApplicationController

  def index
    @initiatives = Initiative.all
    @initiatives_grid = InitiativesGrid.new(params[:initiatives_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def show
    $initiative = Initiative.find(params[:id])
    @area = Area.find($initiative.area_id)
    @meetings = Meeting.where(initiative_id: $initiative)
    @meetings_in_initiatives_grid = MeetingsInInitiativesGrid.
    new(params[:meetings_in_initiatives_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def new
  end
end

class MeetingsInInitiativesGrid

  include Datagrid

  scope do
    Meeting.where(initiative_id: $initiative)
  end

  column(:id, :mandatory => true) do |model|
    format(model.id) do |value|
      link_to value, model
    end
  end
  column(:datetime, :mandatory => true) do |model|
    format(model.datetime) do |value|
      link_to value.strftime("%B %d, %Y - %H:%M"), model
    end
  end

end
