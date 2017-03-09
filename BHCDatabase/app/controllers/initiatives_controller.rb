class InitiativesController < ApplicationController

  skip_before_action :admin_only, only: [:show]
  before_action :correct_initiative_only
  before_action :is_archived, only: [:show]

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
    @users_grid = UsersGrid.new(params[:users_grid]) do |scope|
      scope.where(:id=>@initiative.users.ids)
    end
    @meetings_in_initiatives_grid = MeetingsInInitiativesGrid.
    new(params[:meetings_in_initiatives_grid]) do |scope|
      scope.where(:initiative_id => @initiative).page(params[:page])
    end
    @users = User.all
    @usernames = User.select('name').map(&:name)
    respond_to do |format|
      format.html
      format.json { render json: @usernames }
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

  def archive
    @initiative = Initiative.find(params[:id])
  end

  def update_archive
    @initiative = Initiative.find(params[:id])
    unless @initiative.update_attributes(archive_params)
      flash[:danger] = 'Something went wrong'
      redirect_to @initiative
    else
      redirect_to @initiative
    end
  end

  def unarchive
    @initiative = Initiative.find(params[:id])
    unless @initiative.update_attributes(:archived => false, :reason_archived => nil)
      flash[:danger] = 'Something went wrong'
      redirect_to @initiative
    else
      flash[:success] = 'Initiative is no longer archived'
      redirect_to @initiative
    end
  end

  def is_archived?
    Initiative.find(params[:id]).archived
  end

  private

    def initiative_params
      params.require(:initiative).permit(:name, :description, :area_id, :location, :archived, :reason_archived)
    end
    def archive_params
      params.require(:initiative).permit(:archived, :reason_archived)
    end
end
