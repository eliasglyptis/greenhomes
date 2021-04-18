class ProjectsController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :set_project, except: [:new, :create]
  before_action :is_authorised, only: [:edit, :update]

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to edit_project_path(@project), notice: "Project created successfully."
    else
      redirect_to request.referrer, flash: { error: @service.errors.full_messages }
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end
    # If current user is the owner of the project, then permissions given to run update & create
    def is_authorised
      redirect_to root_path, alert: "Hmm...Sorry, but you don't have permission to do this." unless current_user.id == @project.user_id
    end

    def project_params
      params.require(:project).permit(:estimated_effort, :actual_effort, :type, :name, :status)
    end
end
