class UsersController < ApplicationController
  skip_before_action :admin_only, only: [:show]
  before_action :correct_user_only
  before_action :archive_redirect, only: [:show]

  def index
    # We create 2 grids, one for normal usage and one to be used for download
    @users_grid = UsersGrid.new(params[:users_grid]) { |scope| scope.where(:archived => false) }
    @users_grid_csv = UsersGrid.new(params[:users_grid]) { |scope| scope.where(:archived => false) }
    respond_to do |f|
      f.html do
        # Display the first grid as normal
        @users_grid.scope { |scope| scope.page(params[:page]) }
      end
      f.csv do
        # Send the second grid to csv format and allow to be downloaded
        send_data @users_grid_csv.to_csv,
                  type: "text/csv",
                  disposition: 'inline',
                  filename: "users-#{Time.now.to_s}.csv"
      end
    end
  end

  def show
    @user = User.find(params[:id])
    funder_ids = Array.new
    @user.user_funders.each do |funder|
      funder_ids.push(funder.funder_id)
    end
    @enrolments_grid = EnrolmentsInUsersGrid.new(params[:enrolments_grid]) { |scope| scope.where(:id => @user.enrolments) }
    @unenrolments_grid = UnenrolmentsInUsersGrid.new(params[:unenrolments_grid]) { |scope| scope.where(:id => @user.unenrolments) }
    @feedbacks_grid = FeedbacksGrid.new(params[:feedbacks_grid]) { |scope| scope.where(:id => @user.feedbacks.ids) }
    @conditions_grid = ConditionsGrid.new(params[:conditions_grid]) { |scope| scope.where(:id => @user.conditions.ids) }
    @unassigned_conditions_grid = UnassignedConditionsGrid.new(params[:unassigned_conditions_grid]) { |scope| scope.where(:id => @user.unassigned_conditions.ids) }
    @funders_for_user_grid = FundersForUserGrid.new(params[:funders_for_user_grid]) { |scope| scope.where(:id => @user.user_funders.ids) }
    @removed_funders_for_users_grid = RemovedFundingsForUsersGrid.new(params[:removed_funding_for_users_grid]) { |scope| scope.where(:id => @user.removed_user_fundings.ids) }
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.reg_date &&= Date.today
    @user.known_as &&= @user.forename
    @user.feedback_due = @user.privilege == 2 ? Date.today : nil
    if @user.save
      if @user.privilege == 1
        flash[:success] = 'Succsessfully signed up new volunteer! Please fill in their volunteer details using the button below.'
        redirect_to @user
      else
        flash[:success] = 'Successfully signed up new user!'
        redirect_to @user
      end
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if user_params[:privilege] != '2'
      @user.feedback_due = nil
    else
      @user.feedback_due = Date.today
    end
    if @user.update_attributes(user_params)
      @user.save
      flash[:success] = 'User updated'
    else
      flash[:danger] = 'Something went wrong'
    end
    redirect_to @user
  end

  def destroy
    flash[:success] = 'User deleted' if User.find(params[:id]).destroy
    redirect_to users_url
  end

  def new_volunteer
    @volunteer = Volunteer.new(user_id: params[:id])
  end

  def create_volunteer
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      flash[:success] = 'Completed volunteer details'
      redirect_to User.find(@volunteer.user_id)
    else
      render 'new_volunteer'
    end
  end

  def update_archive
    @user = User.find(params[:id])
    flash[:danger] = 'Something went wrong' unless @user.update_attributes(archive_params)
    redirect_to @user
  end

  def unarchive
    @user = User.find(params[:id])
    if @user.update_attributes(:archived => false, :reason_archived => nil)
      flash[:success] = 'User is no longer archived'
    else
      flash[:danger] = 'Something went wrong'
    end
    redirect_to @user
  end

  def am_i_archived?
    User.find(params[:id]).archived?
  end

  def update_password
    @user = User.find(params[:id])
    if @user.update_attributes(password_params)
      flash[:success] = 'Password updated!'
    else
      flash[:danger] = 'Something went wrong'
    end
    redirect_to @user
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
                                 :address1, :address2, :town, :postcode, :aims, :aims_other, :prevent_attending, :reg_date)
  end

  def archive_params
    params.require(:user).permit(:archived, :reason_archived)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def volunteer_params
    params.require(:volunteer).permit(:user_id, :volunteer_date, :life_experiences, :skills, :aspirations, :num_children, :childcare_help, :carer, :carer_costs, :employment, :registered_disabled, :induction_completed)
  end
end
