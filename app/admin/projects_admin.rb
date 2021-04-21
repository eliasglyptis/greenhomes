Trestle.resource(:projects) do

  menu do
    item :projects, icon: "fa fa-address-card"
  end

  table do
    column :name
    column :display
    column :user, -> (obj) { obj.user.full_name }
    column :user, -> (obj) { obj.user.email }
    column :created_at, align: :center
    actions do |toolbar, instance, admin|
      toolbar.link 'Make Public', admin.path(:activate, id: instance.id), method: :post, class: "btn btn-success"
      toolbar.link 'Make Private', admin.path(:deactivate, id: instance.id), method: :post, class: "btn btn-danger"
    end
  end

  controller do
    def activate
      project = admin.find_instance(params)
      project.update(display: 'Public')

      flash[:message] = "This project is now public"
      redirect_to admin.path(:show, id: project)
    end

    def deactivate
      project = admin.find_instance(params)
      project.update(display: 'Private')

      flash[:message] = "This project is private"
      redirect_to admin.path(:show, id: project)
    end
  end

  routes do
    post :activate, on: :member
    post :deactivate, on: :member
  end

  form do |project|
    text_field :name
    editor :description
    select :display
  end

  search do |query|
    if query
      Project.where("name ILIKE ?", "%#{query}%")
    else
      Project.all
    end
  end

 
end
