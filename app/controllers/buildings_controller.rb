class BuildingsController < ApplicationController

  def show
    @building = Building.find(params[:id])
  end

  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.create(building_params)
    redirect_to @building
  end


  private

  def building_params
    params.require(:building).permit(:title, :code)
  end
end
