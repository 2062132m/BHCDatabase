class MedicalConditionsController < ApplicationController
  def new
  end

  def index
    @conditions = MedicalCondition.all
    @medical_conditions_grid = MedicalConditionsGrid.new(params[:medical_conditions_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def show
    @medical_condition = MedicalCondition.find(params[:id])
  end
end
