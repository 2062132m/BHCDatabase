class FundersController < ApplicationController
  def index
    @funders = Funder.all
    @funders_grid = FundersGrid.new(params[:funders_grid])
  end

  def show
    @funder = Funder.find(params[:id])
  end

  def new
    @funder = Funder.new
  end

  def create
    @funder = Funder.new(funder_params)
    if @funder.save
      flash[:success] = 'Created the new funder!'
      redirect_to @funder
    else
      render 'new'
    end
  end

  def edit
    @funder = Funder.find(params[:id])
  end

  def update
    @funder = Funder.find(params[:id])
    if @funder.update_attributes(funder_params)
      flash[:success] = 'Funder updated successfully'
      redirect_to @funder
    else
      render 'edit'
    end
  end

  def destroy
    Funder.find(params[:id]).destroy
    flash[:success] = 'Funder was successfully deleted'
    redirect_to funders_url
  end

  # Pass a new InitiativeFunder object to the form
  def fund_initiative
    @initiative_funder = InitiativeFunder.new
  end

  # Pass a new MedicalConditionFunder object to the form
  def fund_medical_condition
    @medical_condition_funder = MedicalConditionFunder.new
  end

  # Pass a new UserFunder object to the form
  def fund_user
    @user_funder = UserFunder.new
  end

  def new_fund_initiative
    @initiative_funder = InitiativeFunder.new(funder_id: initiative_funder_params[:funder_id],
                                              initiative_id: initiative_funder_params[:initiative_id])
    if @initiative_funder.save
      flash[:success] = 'Added Funding!'
      redirect_to @initiative_funder.initiative
    else
      redirect_to :back
    end
  end

  def new_fund_medical_condition
    @medical_condition_funder = MedicalConditionFunder.new(funder_id: medical_condition_funder_params[:funder_id],
                                              medical_condition_id: medical_condition_funder_params[:medical_condition_id])
    if @medical_condition_funder.save
      flash[:success] = 'Added Funding!'
      redirect_to @medical_condition_funder.medical_condition
    else
      redirect_to :back
    end
  end

  def new_fund_user
    @user_funder = UserFunder.new(funder_id: user_funder_params[:funder_id],
                                  user_id: user_funder_params[:user_id])
    if @user_funder.save
      flash[:success] = 'Added Funding!'
      redirect_to @user_funder.user
    else
      redirect_to :back
    end
  end

  private

  def funder_params
    params.require(:funder).permit(:name, :description, :email, :url, :telephone, :address)
  end
  def initiative_funder_params
    params.require(:initiative_funder).permit(:funder_id, :initiative_id)
  end
  def medical_condition_funder_params
    params.require(:medical_condition_funder).permit(:funder_id, :medical_condition_id)
  end
  def user_funder_params
    params.require(:user_funder).permit(:funder_id, :user_id)
  end
end
