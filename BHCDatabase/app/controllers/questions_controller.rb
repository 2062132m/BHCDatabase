class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @questions_grid = QuestionsGrid.new(params[:questions_grid]) { |scope| scope.page(params[:page]) }
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = 'Created the new question!'
      redirect_to @question
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:success] = 'Question updated'
      redirect_to @question
    else
      render 'edit'
    end
  end

  private

  def question_params
    params.require(:question).permit(:question, :sort, :visible, :multiple_choice)
  end

end
