class ArchivesController < ApplicationController

  # Displays grids for all models that can be archived
  #   scope.where(:archived => true) is a quick way to limit grids to only archived content
  def index
    @users_grid = UsersGrid.new(params[:users_grid]) { |scope| scope.where(:archived => true) }
    @initiatives_grid = InitiativesGrid.new(params[:initiatives_grid]) { |scope| scope.where(:archived => true) }
    @areas_grid = AreasGrid.new(params[:areas_grid]) { |scope| scope.where(:archived => true) }
    @medical_conditions_grid = MedicalConditionsGrid.new(params[:medical_conditions_grid]) { |scope| scope.where(:archived => true) }
  end
end
