class Admin::CoursesController < ApplicationController
  def index
    @courses = Course.includes(:teachers).includes(:students).all
    render 'empty' if @courses.empty?
  end


  def show
    @course = Course.includes(:teachers).includes(:students).find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to admin_course_path(@course)
    else
      render 'new'
    end
  end

  def edit
    @course = Course.includes(:teachers).includes(:students).find(params[:id])
  end

  def update
    @course = Course.update(course_params)
    redirect_to admin_course_path(@course)
  end

  def destroy
    @course = Course.find(params[:id]).delete
    redirect_to :index
  end

  private

  def course_params
    params.require(:course).permit(:title, :code, teacher_ids: [], student_ids: [])
  end
end
