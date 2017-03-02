class UsersController < ApplicationController

  skip_before_action :admin_only, only: [:show]
  before_action :correct_user_only
  before_action :is_archived, only: [:show]

  def index
    # @users = User.all
    @users_grid = UsersGrid.new(params[:users_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def show
    @user = User.find(params[:id])
    @initiatives_grid = InitiativesGrid.new(params[:initiatives_grid]) do |scope|
      scope.where(:id=>@user.initiatives.ids)
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
    if @user.update_attributes(user_params)
      flash[:success] = 'User updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  def archive
    @user = User.find(params[:id])
  end

  def update_archive
    @user = User.find(params[:id])
    unless @user.update_attribute(:archived, archive_params[:archived])
      flash[:danger] = 'Something went wrong'
      redirect_to @user
      return
    end
    unless @user.update_attribute(:reason_archived, archive_params[:reason_archived])
      flash[:danger] = 'Something went wrong'
      redirect_to @user
      return
    end
    flash[:success] = 'User Archived'
    redirect_to @user
  end

  def unarchive
    @user = User.find(params[:id])
    unless @user.update_attribute(:archived, false)
      flash[:danger] = 'Something went wrong'
      redirect_to @user
      return
    end
    unless @user.update_attribute(:reason_archived, nil)
      flash[:danger] = 'Something went wrong'
      redirect_to @user
      return
    end
    flash[:success] = 'User is no longer archived'
    redirect_to @user
  end

  def is_archived?
    User.find(params[:id]).archived
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :telephone, :emergency_contact, :dob, :privilege, :feedback_due, :archived, :reason_archived)
    end
    def archive_params
      params.require(:user).permit(:archived, :reason_archived)
    end
end
