class InitiativesController < ApplicationController

  def index
    @initiatives = Initiative.all
  end

  def show
    @initiative = Initiative.find(params[:id])
  end

  def new
  end
end
