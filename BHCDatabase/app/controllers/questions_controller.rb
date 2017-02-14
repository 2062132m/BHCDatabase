class QuestionsController < ApplicationController

  before_action :admin?

  def index
    @questions = Question.all
    @questions_grid = QuestionsGrid.new(params[:question_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def show
    @question = Question.find(params[:id])
  end
end
