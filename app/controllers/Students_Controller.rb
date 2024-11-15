class StudentsController < ApplicationController
  def index
    @students = Student.all.order({ created_at: :desc })
    render({ template: "students/index" })
  end

  def show
    @student = Student.find_by(id: params[:path_id])
    if @student.nil?
      redirect_to("/students", { alert: "Student not found." })
    else
      render({ template: "students/show" })
    end
  end

  def create
    @student = Student.new
    @student.first_name = params.fetch("query_first_name")
    @student.last_name = params.fetch("query_last_name")
    @student.email = params.fetch("query_email")

    if @student.save
      redirect_to("/students", { notice: "Student created successfully." })
    else
      redirect_to("/students", { alert: "Student failed to create successfully." })
    end
  end

  def update
    @student = Student.find_by(id: params[:path_id])
    if @student
      @student.first_name = params.fetch("query_first_name")
      @student.last_name = params.fetch("query_last_name")
      @student.email = params.fetch("query_email")

      if @student.save
        redirect_to("/students/#{@student.id}", { notice: "Student updated successfully." })
      else
        redirect_to("/students/#{@student.id}", { alert: "Student failed to update successfully." })
      end
    else
      redirect_to("/students", { alert: "Student not found." })
    end
  end

  def destroy
    @student = Student.find_by(id: params[:path_id])
    if @student
      @student.destroy
      redirect_to("/students", { notice: "Student deleted successfully." })
    else
      redirect_to("/students", { alert: "Student not found." })
    end
  end
end
