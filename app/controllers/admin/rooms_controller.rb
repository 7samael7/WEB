class Admin::RoomsController < AdminController

  before_action :find_building
  before_action :heading_name

  def index
    @rooms = @building.rooms
    render 'empty' if @rooms.empty?
  end

  def all
    @rooms = Room.all
    render 'empty' if @rooms.empty?
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
    redirect_to admin_building_room_path(@building, @room)
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.update(room_params)
    redirect_to admin_building_room_path(@building, @room)
  end

  def destroy
    @room = Room.find(params[:id]).delete
    redirect_to :index
  end

  private

  def heading_name
    @heading_name = "#{@building&.title}: Rooms"
  end

  def room_params
    params.require(:fake).permit(:title, :code)
  end

  def find_building
    @building = Building.find_by id: params[:building_id]
  end
end
