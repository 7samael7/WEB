class CoursesController < ApplicationController

  before_action :find_room_and_building

  def index
    @courses = @room.courses
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = @room.courses.build(course_params)
    @course.save!

    redirect_to building_room_course_path(@building, @room, @course)
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.update(course_params)
    redirect_to course_path @room
  end

  def destroy
    @course = Course.find(params[:id]).delete
    redirect_to :index
  end

  private

  def course_params
    params.require(:faker).permit(:title, :code)
  end

  def find_room_and_building
    @building = Building.find params[:building_id]
    @room = Room.find params[:room_id]
  end
end
