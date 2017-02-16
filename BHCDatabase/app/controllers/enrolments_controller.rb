class EnrolmentsController < ApplicationController
  def index
    @enrolments_grid = EnrolmentsGrid.new(params[:enrolments_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def new
    @enrolment = Enrolment.new
    @initiatives = Initiative.all
    @users = User.all
  end

  def create
    @enrolment = Enrolment.new(enrolment_params)
    @initiatives = Initiative.all
    @users = User.all
    if @enrolment.save
      flash[:success] = 'Created the new enrolment!'
      redirect_to @enrolment.user
    else
      render 'new'
    end
  end

  private

  def enrolment_params
    params.require(:enrolment).permit(:user_id, :initiative_id)
  end

end