class EnrolmentsController < ApplicationController
  def index
    @enrolments_grid = EnrolmentsGrid.new(params[:enrolments_grid]) do |scope|
      scope.page(params[:page])
    end
  end
end
