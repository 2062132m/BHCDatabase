class AreasController < ApplicationController

  # Checks to see if the area is archived before the #show action is called
  before_action :archive_redirect, only: [:show]

  def index
    # Permit params to allow conversion to a hash
    params[:areas_grid].permit! unless params[:areas_grid].nil?
    # Instantiate the grid, without any archived rows
    @areas_grid = AreasGrid.new(params[:areas_grid]) { |scope| scope.where(:archived => false) }

    respond_to do |f|
      f.html do
        # Display the grid as normal
        @areas_grid.scope { |scope| scope.page(params[:page]) }
      end
      f.csv do
        # Upon csv url format, send the grid to a downloadable csv file
        send_data @areas_grid.to_csv,
                  type: 'text/csv',
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
      scope.where(:area_id => @area, :archived => false)
    end

    # Builds a DataGrid using users only enrolled in initiatives in this area
    @users = User.joins(:enrolments).where(enrolments: {initiative: @initiatives.joins(:enrolments)})

    @initiative_graph = Hash.new
    @initiatives.find_each { |init| @initiative_graph[init.name] = init.users.count }

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
    Area.find(params[:id]).destroy ? flash[:success] = 'Area deleted' : flash[:danger] = "An unknown error occurred and the area wasn't deleted. Please try again later or contact support."
    redirect_to areas_url
  end

  def archive
    @area = Area.find(params[:id])
  end

  def update_archive
    @area = Area.find(params[:id])
    if @area.update_attributes(archive_params)
      redirect_to @area
    else
      render 'archive'
    end
  end

  def unarchive
    @area = Area.find(params[:id])
    if @area.update_attributes(:archived => false, :reason_archived => nil)
      flash[:success] = 'Area is no longer archived'
    else
      flash[:danger] = 'An unknown error occurred and the area could not be un-archived. Please try again later or contact support.'
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
