class UsersController < ApplicationController
  skip_before_action :admin_only, only: [:show]

  before_action :correct_user_only
  before_action :archive_redirect, only: [:show]

  def index

    # Permit params to allow conversion to a hash
    params[:users_grid].permit! unless params[:users_grid].nil?

    # Instantiate the grid, without any archived rows
    @users_grid = UsersGrid.new(params[:users_grid]) {|scope| scope.where(:archived => false)}

    respond_to do |f|
      f.html do
        # Display the grid as normal
        @users_grid.scope {|scope| scope.page(params[:page])}
      end
      f.csv do
        # Upon csv url format, send the grid to a downloadable csv file
        send_data @users_grid.to_csv,
                  type: 'text/csv',
                  disposition: 'inline',
                  filename: "users-#{Time.now.to_s}.csv"
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @enrolments_grid = EnrolmentsInUsersGrid.new(params[:enrolments_grid]) {|scope| scope.where(:id => @user.enrolments)}
    @unenrolments_grid = UnenrolmentsInUsersGrid.new(params[:unenrolments_grid]) {|scope| scope.where(:id => @user.unenrolments)}
    @feedbacks_grid = FeedbacksGrid.new(params[:feedbacks_grid]) {|scope| scope.where(:id => @user.feedbacks.ids)}
    @conditions_grid = ConditionsGrid.new(params[:conditions_grid]) {|scope| scope.where(:id => @user.conditions.ids)}
    @unassigned_conditions_grid = UnassignedConditionsGrid.new(params[:unassigned_conditions_grid]) do
    |scope|
      scope.where(:id => @user.unassigned_conditions.ids)
    end
    @funders_for_user_grid = FundersForUserGrid.new(params[:funders_for_user_grid]) do |scope|
      scope.where(:id => @user.user_funders.ids)
    end
    @removed_funders_for_users_grid = RemovedFundingsForUsersGrid.new(params[:removed_funding_for_users_grid]) do |scope|
      scope.where(:id => @user.removed_user_fundings.ids)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.reg_date &&= Date.today
    @user.known_as &&= @user.forename
    @user.feedback_due = Date.today unless @user.admin?
    if @user.save
      if @user.privilege == 1
        flash[:success] = 'Successfully signed up new volunteer! Please fill in their volunteer details using the button below.'
      else
        flash[:success] = 'Successfully signed up new user!'
      end
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.feedback_due = Date.today unless user_params[:privilege].to_i == 0
    if @user.update(user_params)
      flash[:success] = 'The users details were successfully updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    if User.find(params[:id]).destroy
      flash[:success] = 'User was successfully deleted'
    else
      flash[:danger] = "An unknown error occurred and the user was not deleted. Please try again later or contact support."
    end
    redirect_to users_url
  end

  def new_volunteer
    @volunteer = Volunteer.new(user_id: params[:id])
  end

  def create_volunteer
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      flash[:success] = 'Successfully saved the volunteers details'
      redirect_to User.find(@volunteer.user_id)
    else
      render 'new_volunteer'
    end
  end

  def archive
    @user = User.find(params[:id])
  end

  def update_archive
    @user = User.find(params[:id])
    if @user.update(archive_params)
      redirect_to @user
    else
      render 'archive'
    end
  end

  def unarchive
    @user = User.find(params[:id])
    if @user.update(:archived => false, :reason_archived => nil)
      flash[:success] = 'Successfully un-archived the user'
    else
      flash[:danger] = "An unknown error occurred and the user was not un-archived. Please try again later or contact support."
    end
    redirect_to @user
  end

  def am_i_archived?
    User.find(params[:id]).archived?
  end

  def update_password
    @user = User.find(params[:id])
  end

  def change_password
    @user = User.find(params[:id])
    if @user.update(password_params)
      flash[:success] = 'The users password was changed!'
      redirect_to @user
    else
      render 'update_password'
    end
  end

  private

  def correct_user_only
    unless current_user.admin?
      if current_user != User.find(params[:id])
        flash[:danger] = 'You are not allowed to access that page.'
        redirect_to current_user
      end
    end
  end

  def user_params
    params.require(:user).permit(:forename, :surname, :email, :password, :password_confirmation, :telephone, :emergency_name,
                                 :emergency_telephone, :dob, :privilege, :feedback_due, :archived, :reason_archived, :known_as,
                                 :address1, :address2, :town, :postcode, :aims, :aims_other, :prevent_attending, :reg_date,
                                 :chi)
  end

  def archive_params
    params.require(:user).permit(:archived, :reason_archived)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def volunteer_params
    params.require(:volunteer).permit(:user_id, :volunteer_date, :life_experiences, :skills, :aspirations, :num_children,
                                      :childcare_help, :carer, :carer_costs, :employment, :registered_disabled, :induction_completed)
  end
end
