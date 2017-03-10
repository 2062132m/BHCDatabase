class AreasController < ApplicationController

  # Checks to see if the area is archived before the #show action is called
  before_action :is_archived, only: [:show]

  def index
    @areas = Area.all
    @areas_grid = AreasGrid.new(params[:areas_grid]) { |scope| scope.page(params[:page]) }
  end

  def show
    @area = Area.find(params[:id])
    @initiatives = Initiative.where(area_id: @area)

    # Builds a DataGrid using initiatives only belonging to this particular area
    @initiatives_in_area_grid = InitiativesInAreaGrid.new(params[:initiatives_in_area_grid]) do |scope|
      scope.where(:area_id => @area).page(params[:page])
    end

    # Builds a DataGrid using users only enrolled in initiatives in this area
    @users = User.joins(:enrolments).where(enrolments: {initiative: @initiatives.joins(:enrolments)})

    # Builds a DataGrid that shows only users that belong to initiatives in this area
    @users_grid = UsersGrid.new(params[:users_grid]) { |scope| scope.where(:id => @users).page(params[:page]) }

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
    flash[:danger] = 'Something went wrong' unless @area.update_attributes(archive_params)
    redirect_to @area
  end

  def unarchive
    @area = Area.find(params[:id])
    if @area.update_attributes(:archived => false, :reason_archived => nil)
      flash[:success] = 'Area is no longer archived'
    else
      flash[:danger] = 'Something went wrong'
    end
    redirect_to @area
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
