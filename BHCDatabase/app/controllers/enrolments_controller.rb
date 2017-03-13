class EnrolmentsController < ApplicationController
  def index
    @enrolments_grid = EnrolmentsGrid.new(params[:enrolments_grid]) { |scope| scope.page(params[:page]) }
  end

  def create
    # parse values returned to get respective ids
    # could be an issue if we allow duplicate names
    @user = User.where(:name => enrolment_params[:user_id]).first
    @initiative = Initiative.where(:name => enrolment_params[:initiative_id]).first
    # if either is nil, return an empty Enrolment to force an error
    unless @initiative == nil || @user == nil
      @enrolment = Enrolment.new(initiative_id: @initiative.id,
                                 user_id: @user.id)
    else
      @enrolment = Enrolment.new
    end
    if @enrolment.save
      flash[:success] = 'Created the new enrolment!'
      redirect_to @enrolment.user
    else
      flash[:danger] = 'This activity/user does not exist'
      # redirect back to the form
      redirect_to :back
    end
  end

  def enrol_user
    @enrolment = Enrolment.new
    @users = User.all
    # get all the users and consolidate into a JSON object
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def enrol_initiative
    @enrolment = Enrolment.new
    @initiatives = Initiative.all
    # get all the initiatives and consolidate into a JSON object
    respond_to do |format|
      format.html
      format.json { render json: @initiatives }
    end
  end

  def destroy
    # Get the enrolment
    @enrolment = Enrolment.find(params[:id])
    # Create an unenrolment with identical details
    Unenrolment.create(:user_id => @enrolment.user_id,
                       :initiative_id => @enrolment.initiative_id)
    # Destory the enrolment
    flash[:success] = 'User Unenrolled' if @enrolment.destroy
    redirect_to :back
  end

  private

  def enrolment_params
    params.require(:enrolment).permit(:user_id, :initiative_id)
  end

end
