class FundersController < ApplicationController

  def index
  end

  def show
    @funder = Funder.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
