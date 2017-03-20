class FundersController < ApplicationController
  def index
    @funders_grid = FundersGrid.new(params[:funders_grid])
  end

  def show
    @funder = Funder.find(params[:id])
    @initiatives = @funder.initiatives
    @medical_conditions = @funder.medical_conditions
    @users = @funder.users
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
    if @funder.update(funder_params)
      flash[:success] = 'Funder updated successfully'
      redirect_to @funder
    else
      render 'edit'
    end
  end

  def destroy
    if Funder.find(params[:id]).destroy
      flash[:success] = 'Funder was successfully deleted'
    else
      flash[:danger] = "An unknown error occurred and the funder was not deleted. Please try again later or contact support."
    end
    redirect_to funders_url
  end

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

  def remove_user_funding
    @user_funder = UserFunder.find(params[:id])
    # Create a "RemovedUserFunding" with identical details
    @removed_user_funding = RemovedUserFunding.new(:funder_id => @user_funder.funder_id,
                                                   :user_id => @user_funder.user_id,
                                                   :date_given => @user_funder.created_at)
    if @user_funder.destroy
      if @removed_user_funding.save
        flash[:success] = 'Removed funding from the user and recorded history of this'
      else
        flash[:warning] = "Removed funding however the history of this funding wasn't recorded"
      end
    else
      flash[:danger] = "An unknown error occurred and funding was not removed. Please try again later or contact support."
    end
    redirect_to funders_url
  end

  def remove_initiative_funding
    @initiative_funder = InitiativeFunder.find(params[:id])
    # Create a "RemovedUserFunding" with identical details
    @removed_initiative = RemovedInitiativeFunding.new(:funder_id => @initiative_funder.funder_id,
                                                       :initiative_id => @initiative_funder.initiative_id,
                                                       :date_given => @initiative_funder.created_at)
    if @initiative_funder.destroy
      if @removed_initiative.save
        flash[:success] = 'Removed funding from the initiative and recorded history of this'
      else
        flash[:warning] = "Removed funding however the history of this funding wasn't recorded"
      end
    else
      flash[:danger] = "An unknown error occurred and funding was not removed. Please try again later or contact support."
    end
    redirect_to funders_url
  end

  def remove_medical_funding
    @medical_funder = MedicalConditionFunder.find(params[:id])
    # Create a "RemovedUserFunding" with identical details
    @removed_medical = RemovedMedicalFunding.new(:funder_id => @medical_funder.funder_id,
                                                 :medical_condition_id => @medical_funder.medical_condition_id,
                                                 :date_given => @medical_funder.created_at)
    if @medical_funder.destroy
      if @removed_medical.save
        flash[:success] = 'Removed funding from the medical condition and recorded history of this'
      else
        flash[:warning] = "Removed funding however the history of this funding wasn't recorded"
      end
    else
      flash[:danger] = "An unknown error occurred and funding was not removed. Please try again later or contact support."
    end
    redirect_to funders_url
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
