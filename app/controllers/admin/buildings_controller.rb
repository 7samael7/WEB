class Admin::BuildingsController < AdminController



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

  def new
      @building = Building.new
  end

   def create
     @building = Building.new(building_params)
     if @building.save
       redirect_to admin_buildings_path(@building)
     else
       render 'new'
     end
   end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.update(building_params)
    redirect_to admin_buildings_path @building
  end

  def destroy
    @building = Building.find(params[:id]).delete
    redirect_to :index
  end

  private

  def heading_name
    @heading_name = "Buildings"
  end

  def building_params
    params.require(:building).permit(:title, :code)
  end
end
