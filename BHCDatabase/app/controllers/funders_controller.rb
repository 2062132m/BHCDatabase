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
    @funder = Funder.find(params[:id])
  end

  def update
    @funder = Funder.find(params[:id])
    if @funder.update_attributes(funder_params)
      flash[:success] = 'Funder updated successfully'
      redirect_to @funder
    else
      render 'edit'
    end
  end

  def destroy
    Funder.find(params[:id]).destroy
    flash[:success] = 'Funder was successfully deleted'
    redirect_to funders_url
  end

  private

  def funder_params
    params.require(:funder).permit(:name, :description, :email, :url, :telephone, :address)
  end
end
