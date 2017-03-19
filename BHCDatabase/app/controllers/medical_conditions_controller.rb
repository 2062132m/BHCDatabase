class MedicalConditionsController < ApplicationController
  before_action :archive_redirect, only: [:show]

  def new
    @medical_condition = MedicalCondition.new
  end

  def create
    @medical_condition = MedicalCondition.new(medical_condition_params)
    if @medical_condition.save
      flash[:success] = 'Created the new medical condition!'
      redirect_to @medical_condition
    else
      render 'new'
    end
  end

  def index
    @conditions = MedicalCondition.where(:archived => false)
    @medical_conditions_grid = MedicalConditionsGrid.new(params[:medical_conditions_grid]) do |scope|
      scope.where(:archived => false).page(params[:page])
    end
  end

  def show
    @medical_condition = MedicalCondition.find(params[:id])
    @conditions = @medical_condition.conditions
    @conditions_grid = UsersGrid.new(params[:users_grid]) { |scope| scope.where(:id => @conditions.map(&:user_id), :archived => false) }
    @funders_for_medical_condition_grid = FundersForMedicalConditionGrid.new(params[:funders_for_medical_condition_grid]) do |scope|
      scope.where(:id => @medical_condition.medical_condition_funders.ids)
    end
    @removed_funders_for_medical_condition_grid = RemovedFundingsForMedicalConditionsGrid.new(params[:removed_funders_for_medical_conditions_grid]) do |scope|
      scope.where(:id => @medical_condition.removed_medical_fundings.ids)
    end
  end

  def edit
    @medical_condition = MedicalCondition.find(params[:id])
  end

  def update
    @medical_condition = MedicalCondition.find(params[:id])
    if @medical_condition.update(medical_condition_params)
      flash[:success] = 'Medical Condition Updated'
      redirect_to @medical_condition
    else
      render 'edit'
    end
  end

  def destroy
    if MedicalCondition.find(params[:id]).destroy
      flash[:success] = 'Medical Condition was successfully deleted'
    else
      flash[:danger] = "Something went wrong and the medical condition wasn't deleted"
    end
    redirect_to medical_conditions_url
  end

  def archive
    @medical_condition = MedicalCondition.find(params[:id])
  end

  def update_archive
    @medical_condition = MedicalCondition.find(params[:id])
    flash[:danger] = "Something went wrong and the archive wasn't updated" unless @medical_condition.update(archive_params)
    redirect_to @medical_condition
  end

  def unarchive
    @medical_condition = MedicalCondition.find(params[:id])
    if @medical_condition.update_attributes(:archived => false, :reason_archived => nil)
      flash[:success] = 'Medical condition is no longer archived'
    else
      flash[:danger] = "Something went wrong and the medical condition wasn't un-archived"
    end
    redirect_to @medical_condition
  end

  def am_i_archived?
    MedicalCondition.find(params[:id]).archived?
  end

  private

  def medical_condition_params
    params.require(:medical_condition).permit(:name, :description, :archived, :reason_archived)
  end

  def archive_params
    params.require(:medical_condition).permit(:archived, :reason_archived)
  end
end
