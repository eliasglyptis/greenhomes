Trestle.admin(:dashboard) do
  menu do
    item :dashboard, icon: "fa fa-tachometer"
  end

  controller do
    def index
      @user_count = User.count()
      @project_count = Project.count()
    end
  end
end