class ConditionsController < ApplicationController
  def new
    @condition = Condition.new
    @medical_conditions = MedicalCondition.where(:archived => false)

    # Get all the medical_conditions and consolidate into a JSON object
    respond_to do |format|
      format.html
      format.json { render json: @medical_conditions }
    end
  end

  def create
    @medical_condition = MedicalCondition.where(:name => condition_params[:medical_condition_id]).first
    if @medical_condition
      @condition = Condition.new(medical_condition_id: @medical_condition.id, user_id: condition_params[:user_id])
    else
      flash[:danger] = "Either that condition doesn't exist or you didn't select one."
      redirect_to User.find(condition_params[:user_id])
      return
    end

    if @condition.save
      flash[:success] = 'Assigned the new condition!'
      redirect_to @condition.user
    else
      flash[:danger] = 'An unknown error occurred and the condition was not successfully assigned. Check the user does not already have this condition.'
      redirect_to User.find(condition_params[:user_id])
    end
  end

  def destroy
    # Get the condition
    @condition = Condition.find(params[:id])
    # Create an unassigned_condition with identical details
    @unassigned_condition = UnassignedCondition.new(:user_id => @condition.user_id,
                                                    :medical_condition_id => @condition.medical_condition_id,
                                                    :date_assigned => @condition.created_at)
    if @condition.destroy
      if @unassigned_condition.save
        flash[:success] = 'Saved the history of the user having this condition and unassigned the condition.'
      else
        flash[:danger] = "Condition unassigned however an unknown error occurred and the history of this wasn't recorded. Please contact support."
      end
    else
      flash[:danger] = "An unknown error occurred and the condition wasn't successfully unassigned. Please contact support."
    end
    redirect_to :back
  end

  private

  def condition_params
    params.require(:condition).permit(:medical_condition_id, :user_id)
  end
end
