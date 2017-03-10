class ConditionsController < ApplicationController
  def new
    @condition = Condition.new
    @medical_conditions = MedicalCondition.all
    # get all the users and consolidate into a JSON object
    respond_to do |format|
      format.html
      format.json { render json: @medical_conditions }
    end
  end

  def create
    # parse values returned to get respective ids
    # could be an issue if we allow duplicate names
    @medical_condition = MedicalCondition.where(:name => condition_params[:medical_condition_id]).first
    # if either is nil, return an empty Enrolment to force an error
    unless @medical_condition == nil
      @condition = Condition.new(medical_condition_id: @medical_condition.id,
                                 user_id: condition_params[:user_id])
    else
      @condition = Condition.new
    end
    if @condition.save
      flash[:success] = 'Assigned the new condition!'
      redirect_to @condition.user
    else
      flash[:danger] = 'This medical condition does not exist'
      # redirect back to the form
      redirect_to :back
    end
  end

  private

  def condition_params
    params.require(:condition).permit(:medical_condition_id, :user_id)
  end

end
