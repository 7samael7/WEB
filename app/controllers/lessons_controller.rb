class LessonsController < ApplicationController

  before_action :find_room_and_building
  before_action :heading_name

  def index
    @lessons = @room.lessons.this_week.includes(:course).order(start_at: :asc)

  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  private

  def heading_name
    @heading_name = "#{@room.title}: Schedule"
  end

  def lesson_params
    params.require(:faker).permit(:start_at, :duration)
  end

  def find_room_and_building
    @building = Building.find params[:building_id]
    @room = Room.find params[:room_id]
  end
end
