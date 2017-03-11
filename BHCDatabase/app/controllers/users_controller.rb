class UsersController < ApplicationController

  skip_before_action :admin_only, only: [:show]
  before_action :correct_user_only
  before_action :is_archived, only: [:show]


  def index
    # We create 2 grids, one for normal usage and one to be used for download
    @users_grid = UsersGrid.new(params[:users_grid])
    @users_grid_csv = UsersGrid.new(params[:users_grid])
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
    @enrolments_grid = EnrolmentsInUsersGrid.new(params[:enrolments_grid]) do |scope|
      scope.where(:id=>@user.enrolments)
    end
    @feedbacks_grid = FeedbacksGrid.new(params[:feedbacks_grid]) do |scope|
      scope.where(:id=>@user.feedbacks.ids)
    end
    @conditions_grid = ConditionsGrid.new(params[:conditions_grid]) do |scope|
      scope.where(:id=>@user.conditions.ids)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.privilege == 2
      @user.feedback_due = Date.today
    else
      @user.feedback_due = nil
    end

    if @user.save
      flash[:success] = 'Successfully signed up new user!'
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
    unless @user.update_attributes(user_params)
      flash[:danger] = 'Something went wrong'
      redirect_to @user
    else
      flash[:success] = 'User updated'
      redirect_to @user
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  def update_archive
    @user = User.find(params[:id])
    unless @user.update_attributes(archive_params)
      flash[:danger] = 'Something went wrong'
      redirect_to @user
    else
      redirect_to @user
    end
  end

  def unarchive
    @user = User.find(params[:id])
    unless @user.update_attributes(:archived => false, :reason_archived => nil)
      flash[:danger] = 'Something went wrong'
      redirect_to @user
    else
      flash[:success] = 'User is no longer archived'
      redirect_to @user
    end
  end

  def is_archived?
    User.find(params[:id]).archived
  end

  def update_password
    @user = User.find(params[:id])
    unless @user.update_attributes(password_params)
      flash[:danger] = 'Something went wrong'
      redirect_to @user
    else
      flash[:success] = 'Password updated!'
      redirect_to @user
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :telephone, :emergency_contact, :dob, :privilege, :feedback_due, :archived, :reason_archived)
    end
    def archive_params
      params.require(:user).permit(:archived, :reason_archived)
    end
    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
