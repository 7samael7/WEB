class RoomsController < ApplicationController
  before_action :find_building
  before_action :heading_name

  def index
    @rooms = @building.rooms
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = @building.rooms.build(room_params)
    @room.save!
    redirect_to building_room_path(@building, @room)
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.update(room_params)
    redirect_to room_path @room
  end

  def destroy
    @room = Room.find(params[:id]).delete
    redirect_to :index
  end

  private

  def heading_name
    @heading_name = "#{@building.title}: Rooms"
  end

  def room_params
    params.require(:fake).permit(:title, :code)
  end

  def find_building
    @building = Building.find params[:building_id]
  end
end
