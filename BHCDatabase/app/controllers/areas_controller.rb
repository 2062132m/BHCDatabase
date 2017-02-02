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
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    if @area.save
      flash[:success] = 'Created the new area!'
      redirect_to @area
    else
      render 'new'
    end
  end

  def destroy
    Area.find(params[:id]).destroy
    flash[:success] = "Area deleted"
    redirect_to areas_url
  end

  private

    def area_params
      params.require(:area).permit(:name, :description)
    end
end
