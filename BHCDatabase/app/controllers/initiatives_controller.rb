class InitiativesController < ApplicationController

  def index
    @initiatives = Initiative.all
  end

  def show
    @initiatives = Initiative.find(params[:id])
  end

  def new
  end
end
