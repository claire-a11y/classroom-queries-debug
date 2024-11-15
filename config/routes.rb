Rails.application.routes.draw do
  get("/", { :controller => "departments", :action => "index" })

  #------------------------------
  # Department routes

  get("/departments", { controller: "departments", action: "index" })
  get("/departments/:path_id", { controller: "departments", action: "show" })
  post("/insert_department", { controller: "departments", action: "create" })
  post("/modify_department/:path_id", { controller: "departments", action: "update" })
  get("/delete_department/:path_id", { controller: "departments", action: "destroy" }) 

  #------------------------------
  # Course routes

  get "/courses", to: "courses#index"                 # 课程列表页面
  get "/courses/:path_id", to: "courses#show"         # 课程详细信息页面
  post "/insert_course", to: "courses#create"         # 创建课程
  post "/modify_course/:path_id", to: "courses#update" # 更新课程
  get "/delete_course/:path_id", to: "courses#destroy" # 删除课程
  

  #------------------------------
  # Student routes

  get("/students", { controller: "students", action: "index" })
  get("/students/:path_id", { controller: "students", action: "show" })
  post("/insert_student", { controller: "students", action: "create" })
  post("/modify_student/:path_id", { controller: "students", action: "update" })
  get("/delete_student/:path_id", { controller: "students", action: "destroy" }) 

  #------------------------------

  post("/insert_enrollment", { :controller => "enrollments", :action => "create" })

end
