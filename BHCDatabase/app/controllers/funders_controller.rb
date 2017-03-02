class FundersController < ApplicationController

  def index
    @funders = Funder.all
  end

  def show
    @funder = Funder.find(params[:id])
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
  end

  def update
  end

  private

  def funder_params
    params.require(:funder).permit(:name, :description, :email, :url, :telephone, :address)
  end
end
