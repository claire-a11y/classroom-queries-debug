class CoursesController < ApplicationController
  # 显示所有课程
  def index
    @courses = Course.all.order({ :created_at => :desc })
    render({ :template => "courses/index" })
  end

  # 显示单个课程的详细信息
  def show
    the_id = params.fetch("path_id")
    @course = Course.find_by(id: the_id)

    if @course.nil?
      redirect_to("/courses", { :alert => "Course not found." })
    else
      render({ :template => "courses/show" })
    end
  end

  # 创建新课程
  def create
    @course = Course.new
    @course.title = params.fetch("query_title")
    @course.term_offered = params.fetch("query_term_offered")
    @course.department_id = params.fetch("query_department_id")

    if @course.valid?
      @course.save
      redirect_to("/courses", { :notice => "Course created successfully." })
    else
      redirect_to("/courses", { :alert => "Course failed to create successfully." })
    end
  end

  # 更新课程信息
  def update
    the_id = params.fetch("path_id")
    @course = Course.find_by(id: the_id)

    if @course.nil?
      redirect_to("/courses", { :alert => "Course not found." })
    else
      @course.title = params.fetch("query_title")
      @course.term_offered = params.fetch("query_term_offered")
      @course.department_id = params.fetch("query_department_id")

      if @course.valid?
        @course.save
        redirect_to("/courses/#{@course.id}", { :notice => "Course updated successfully." })
      else
        redirect_to("/courses/#{@course.id}", { :alert => "Course failed to update successfully." })
      end
    end
  end

  # 删除课程
  def destroy
    the_id = params.fetch("path_id")
    @course = Course.find_by(id: the_id)
  
    if @course
      @course.destroy
      redirect_to("/courses", { notice: "Course deleted successfully." })
    else
      redirect_to("/courses", { alert: "Course not found." })
    end
  end
  
end
