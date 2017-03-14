class FundersController < ApplicationController
  def index
    @funders = Funder.all
    @funders_grid = FundersGrid.new(params[:funders_grid])
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

  def fund_initiative
    @fund_initiative = InitiativeFunder.new
  end

  def new_fund_initiative
    @funder = Funder.where(:name => initiative_funder_params[:funder_id]).first
    unless @funder == nil
      @initiative_funder = InitiativeFunder.new(funder_id: @funder.id,
                                                initiative_id: initiative_funder_params[:initiative_id])
    else
      @initiative_funder = InitiativeFunder.new
    end
    if @initiative_funder.save
      flash[:success] = 'Added Funding!'
      redirect_to @initiative_funder.initiative
    else
      flash[:danger] = 'This funder does not exist'
      redirect_to :back
    end
  end

  private

  def funder_params
    params.require(:funder).permit(:name, :description, :email, :url, :telephone, :address)
  end
  def initiative_funder_params
    params.require(:initiative_funder).permit(:funder_id, :initiative_id)
  end
end
