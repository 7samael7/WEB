class LessonsController < ApplicationController

  before_action :find_room_and_building

  def index
    @lessons = @room.lessons.this_week.order(start_at: :asc)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = @room.lessons.build(lesson_params)
    @lesson.save!

    redirect_to building_room_lesson_path(@building, @room, @lesson)
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.update(lesson_params)
    redirect_to building_room_lesson_path(@building, @room, @lesson)
  end

  def destroy
    @lesson = Lesson.find(params[:id]).delete
    redirect_to :index
  end

  private

  def lesson_params
    params.require(:faker).permit(:start_at, :durration)
  end

  def find_room_and_building
    @building = Building.find params[:building_id]
    @room = Room.find params[:room_id]
  end
end
