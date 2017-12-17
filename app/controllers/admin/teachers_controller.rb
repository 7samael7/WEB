class Admin::TeachersController < ApplicationController

  def index
    @teachers = Teacher.all
    render 'empty' if @teachers.empty?
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to admin_teacher_path(@teacher)
    else
      render 'new'
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.update(teacher_params)
    redirect_to admin_teacher_path(@teacher)
  end

  def destroy
    @teacher = Teacher.find(params[:id]).delete
    redirect_to :index
  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :email)
  end
end
