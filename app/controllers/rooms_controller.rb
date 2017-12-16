class RoomsController < ApplicationController
  def index
    @rooms = Room.where building_id: params[:building_id]
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create(room_params)
    redirect_to @room
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

  def room_params
    params.require(:room).permit(:building_id ,:title, :code)
  end

end
