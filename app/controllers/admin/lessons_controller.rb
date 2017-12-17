class Admin::LessonsController < AdminController

  before_action :find_room_and_building
  before_action :heading_name

  def index
    @lessons = @room.lessons.this_week.includes(:course).order(start_at: :asc)
    render 'empty' if @lessons.empty?
  end

  def all
    @lessons = Lesson.all
    render 'empty' if @lessons.empty?
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create

    @lesson = @room.lessons.build(lesson_params)

    if @lesson.save
      redirect_to admin_building_room_lessons_path(@building, @room)
    else
      render 'new'
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.update(lesson_params)
    redirect_to admin_building_room_lesson_path(@building, @room, @lesson)
  end

  def destroy
    @lesson = Lesson.find(params[:id]).delete
    redirect_to :index
  end

  private

  def heading_name
    @heading_name = "#{@room&.title}: Schedule"
  end

  def lesson_params
    params.require(:faker).permit(:start_at, :duration, :teacher_id, :course_id)
  end

  def find_room_and_building
    @building = Building.find_by id: params[:building_id]
    @room = Room.find_by id: params[:room_id]
  end
end
