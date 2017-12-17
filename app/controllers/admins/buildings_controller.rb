class BuildingsController < ApplicationController

  before_action :heading_name

  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find(params[:id])
  end

  def overview
    @building = Building.find(params[:id])
    @rooms = @building.rooms
  end

  private

  def heading_name
    @heading_name = "Buildings"
  end

  def building_params
    params.require(:building).permit(:title, :code)
  end
end
