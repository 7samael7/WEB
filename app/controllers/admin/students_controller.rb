class Admin::StudentsController < ApplicationController
  def index
    @students = Student.all
    render 'empty' if @students.empty?
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to admin_student_path(@student)
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.update(student_params)
    redirect_to admin_student_path(@student)
  end

  def destroy
    @student = Student.find(params[:id]).delete
    redirect_to :index
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end
end
