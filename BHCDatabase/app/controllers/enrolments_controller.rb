class EnrolmentsController < ApplicationController
  def create
    @user = User.where(:known_as => enrolment_params[:user_id]).first
    @initiative = Initiative.where(:name => enrolment_params[:initiative_id]).first

    if @initiative && @user
      @enrolment = Enrolment.new(initiative_id: @initiative.id, user_id: @user.id)
    else
      flash[:danger] = "Either that initiative doesn't exist or you didn't select one"
      redirect_to :back
      return
    end

    if @enrolment.save
      flash[:success] = 'Created the new enrolment!'
      redirect_to @enrolment.user
    else
      flash[:danger] = "An unknown error occurred and the user was not enrolled. Please try again later or contact support."
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
    @enrolment = Enrolment.find(params[:id])

    @un_enrolment = Unenrolment.new(:user_id => @enrolment.user_id,
                                    :initiative_id => @enrolment.initiative_id,
                                    :date_enrolled => @enrolment.created_at)
    if @enrolment.destroy
      if @un_enrolment.save
        flash[:success] = 'Saved the history of the user having this enrolment and un-enrolled the user.'
      else
        flash[:danger] = "Un-enrolled however an unknown error occurred and the history of this was not recorded. Please contact support."
      end
    else
      flash[:danger] = "An unknown error occurred the user was not un-enrolled. Please try again later or contact support."
    end
    redirect_to :back
  end

  private

  def enrolment_params
    params.require(:enrolment).permit(:user_id, :initiative_id)
  end

end
