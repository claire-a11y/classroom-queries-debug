class DepartmentsController < ApplicationController
  def index
    @departments = Department.all.order({ created_at: :desc })
    render({ template: "departments/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @department = Department.find_by(id: the_id)

    if @department.nil?
      redirect_to("/departments", { alert: "Department not found." })
    else
      render({ template: "departments/show" })
    end
  end

  def create
    @department = Department.new
    @department.name = params.fetch("query_name")

    if @department.valid?
      @department.save
      redirect_to("/departments", { notice: "Department created successfully." })
    else
      redirect_to("/departments", { alert: "Department failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @department = Department.find_by(id: the_id)

    if @department
      @department.name = params.fetch("query_name")

      if @department.valid?
        @department.save
        redirect_to("/departments/#{@department.id}", { notice: "Department updated successfully." })
      else
        redirect_to("/departments/#{@department.id}", { alert: "Department failed to update successfully." })
      end
    else
      redirect_to("/departments", { alert: "Department not found." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @department = Department.find_by(id: the_id)

    if @department
      @department.destroy
      redirect_to("/departments", { notice: "Department deleted successfully." })
    else
      redirect_to("/departments", { alert: "Department not found." })
    end
  end
end
