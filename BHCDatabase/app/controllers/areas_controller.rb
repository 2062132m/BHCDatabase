class AreasController < ApplicationController

  before_action :is_archived, only: [:show]

  def index
    @areas = Area.all
    @areas_grid = AreasGrid.new(params[:areas_grid])
    @areas_grid_csv = AreasGrid.new(params[:areas_grid])
      respond_to do |f|
        f.html do
          @areas_grid.scope { |scope| scope.page(params[:page]) }
        end
        f.csv do
          send_data @areas_grid_csv.to_csv,
            type: "text/csv",
            disposition: 'inline',
            filename: "grid-#{Time.now.to_s}.csv"
        end
      end
  end

  def show

    @area = Area.find(params[:id])
    @initiatives = Initiative.where(area_id: @area)
    @initiatives_in_area_grid = InitiativesInAreaGrid.
        new(params[:initiatives_in_area_grid]) do |scope|
      scope.where(:area_id => @area).page(params[:page])
    end

    @users = User.joins(:enrolments).
        where(enrolments: {initiative: @initiatives.joins(:enrolments)})

    @users_grid = UsersGrid.new(params[:users_grid]) do |scope|
      scope.where(:id => @users).page(params[:page])
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

  def edit
    @area = Area.find(params[:id])
  end

  def update
    @area = Area.find(params[:id])
    if @area.update_attributes(area_params)
      flash[:success] = 'Area updated'
      redirect_to @area
    else
      render 'edit'
    end
  end

  def destroy
    Area.find(params[:id]).destroy
    flash[:success] = 'Area deleted'
    redirect_to areas_url
  end

  def update_archive
    @area = Area.find(params[:id])
    unless @area.update_attributes(archive_params)
      flash[:danger] = 'Something went wrong'
      redirect_to @area
    else
      redirect_to @area
    end
  end

  def unarchive
    @area = Area.find(params[:id])
    unless @area.update_attributes(:archived => false, :reason_archived => nil)
      flash[:danger] = 'Something went wrong'
      redirect_to @area
    else
      flash[:success] = 'Area is no longer archived'
      redirect_to @area
    end
  end

  def is_archived?
    Area.find(params[:id]).archived
  end

  private

  def area_params
    params.require(:area).permit(:name, :description, :archived, :reason_archived)
  end

  def archive_params
    params.require(:area).permit(:archived, :reason_archived)
  end
end
