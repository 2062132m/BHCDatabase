class InitiativesController < ApplicationController

  before_action :admin?

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
    @meetings_in_initiatives_grid = MeetingsInInitiativesGrid.
    new(params[:meetings_in_initiatives_grid]) do |scope|
      scope.where(:initiative_id => @initiative).page(params[:page])
    end
  end

  def new
    @initiative = Initiative.new
    @areas = Area.all
  end

  def create
    @initiative = Initiative.new(initiative_params)
    @areas = Area.all
    if @initiative.save
      flash[:success] = 'Created the new initiative!'
      redirect_to @initiative
    else
      render 'new'
    end
  end

  def edit
    @initiative = Initiative.find(params[:id])
    @areas = Area.all
  end

  def update
    @initiative = Initiative.find(params[:id])
    if @initiative.update_attributes(initiative_params)
      flash[:success] = "Initiative updated"
      redirect_to @initiative
    else
      render 'edit'
    end
  end

  def destroy
    Initiative.find(params[:id]).destroy
    flash[:success] = "Initiative deleted"
    redirect_to initiatives_url
  end

  private

    def initiative_params
      params.require(:initiative).permit(:name, :description, :area_id, :location)
    end
end
