class AreasController < ApplicationController

  # Checks to see if the area is archived before the #show action is called
  before_action :archive_redirect, only: [:show]

  def index
    @areas = Area.all
    # We create 2 grids, one for normal usage and one to be used for download
    @areas_grid = AreasGrid.new(params[:areas_grid]) { |scope| scope.where(:archived => false) }
    @areas_grid_csv = AreasGrid.new(params[:areas_grid]) { |scope| scope.where(:archived => false) }
      respond_to do |f|
        f.html do
          # Display the first grid as normal
          @areas_grid.scope { |scope| scope.page(params[:page]) }
        end
        f.csv do
          # Send the second grid to csv format and allow to be downloaded
          send_data @areas_grid_csv.to_csv,
            type: "text/csv",
            disposition: 'inline',
            filename: "areas-#{Time.now.to_s}.csv"
        end
      end
  end

  def show
    @area = Area.find(params[:id])
    @initiatives = Initiative.where(area_id: @area)

    # Builds a DataGrid using initiatives only belonging to this particular area
    @initiatives_in_area_grid = InitiativesInAreaGrid.new(params[:initiatives_in_area_grid]) do |scope|
      scope.where(:area_id => @area, :archived => false).page(params[:page])
    end

    # Builds a DataGrid using users only enrolled in initiatives in this area
    @users = User.joins(:enrolments).where(enrolments: {initiative: @initiatives.joins(:enrolments)})

    # Builds a DataGrid that shows only users that belong to initiatives in this area
    @users_grid = UsersGrid.new(params[:users_grid]) { |scope| scope.where(:id => @users, :archived => false).page(params[:page]) }

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

  def am_i_archived?
    Area.find(params[:id]).archived?
  end

  private

  def area_params
    params.require(:area).permit(:name, :description, :archived, :reason_archived)
  end

  def archive_params
    params.require(:area).permit(:archived, :reason_archived)
  end
end
