class UsersController < ApplicationController

  skip_before_action :admin_only, only: [:show]
  before_action :correct_user_only

  def index
    # @users = User.all
    @users_grid = UsersGrid.new(params[:users_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def show
    @user = User.find(params[:id])
    @initiatives_grid = InitiativesGrid.new(params[:initiatives_grid]) do |scope|
      scope.find(@user.initiatives.ids)
    end
    @feedbacks_grid = FeedbacksGrid.new(params[:feedbacks_grid]) do |scope|
      scope.find(@user.feedbacks.ids)
    end
    @conditions_grid = ConditionsGrid.new(params[:conditions_grid]) do |scope|
      scope.find(@user.conditions.ids)
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

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :telephone, :dob, :privilege, :feedback_due)
    end
end
