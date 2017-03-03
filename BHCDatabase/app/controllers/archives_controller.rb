class ArchivesController < ApplicationController
  def index
    @users_grid = UsersGrid.new(params[:users_grid]) do |scope|
      scope.where(:archived=>true)
    end
    @initiatives_grid = InitiativesGrid.new(params[:initiatives_grid]) do |scope|
      scope.where(:archived=>true)
    end
    @areas_grid = AreasGrid.new(params[:areas_grid]) do |scope|
      scope.where(:archived=>true)
    end
    @medical_conditions_grid = MedicalConditionsGrid.new(params[:medical_conditions_grid]) do |scope|
      scope.where(:archived=>true)
    end
  end
end
