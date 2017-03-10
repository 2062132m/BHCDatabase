class UsersController < ApplicationController
  skip_before_action :admin_only, only: [:show]
  before_action :correct_user_only
  before_action :is_archived, only: [:show]

  def index
    @users_grid = UsersGrid.new(params[:users_grid]) { |scope| scope.page(params[:page]) }
  end

  def show
    @user = User.find(params[:id])
    @enrolments_grid = EnrolmentsInUsersGrid.new(params[:enrolments_grid]) { |scope| scope.where(:id => @user.enrolments) }
    @feedbacks_grid = FeedbacksGrid.new(params[:feedbacks_grid]) { |scope| scope.where(:id => @user.feedbacks.ids) }
    @conditions_grid = ConditionsGrid.new(params[:conditions_grid]) { |scope| scope.where(:id => @user.conditions.ids) }
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.feedback_due = @user.privilege == 2 ? Date.today : nil
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
    if @user.update_attributes(user_params)
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

  def is_archived?
    User.find(params[:id]).archived
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
