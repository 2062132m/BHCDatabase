class UsersController < ApplicationController

  def index
    # @users = User.all
    @users_grid = UsersGrid.new(params[:users_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def show
    @user = User.find(params[:id])
    # debugger
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

class UsersGrid

  include Datagrid

  scope do
    User.where(:privilege => false)
  end

  column(:id, :mandatory => true) do |model|
    format(model.id) do |value|
      link_to value, model
    end
  end
  column(:name, :mandatory => true) do |model|
    format(model.name) do |value|
      link_to value, model
    end
  end
  column(:email, :mandatory => true)
  column(:telephone, :mandatory => true)
  column(:dob, :mandatory => true)
  column(:privilege, :mandatory => true)

end
