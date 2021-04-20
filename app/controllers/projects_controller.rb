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
      redirect_to root_path, notice: "Project created successfully."
    else
      redirect_to request.referrer, flash: { error: @project.errors.full_messages }
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      if !(@project.actual_effort > 0) && project_params[:status] == "Completed"
        return redirect_to request.referrer, flash: {error: "In order to mark your project compled, you need to add the Actual Effort from 1 to 10"}
      else
      redirect_to edit_project_path(@project), notice: "Your project has been updated successfully!"
      end
    else
      return redirect_to request.referrer, flash: {error: @project.errors.full_messages}
    end
  end

  def show
  end

  def status_complete
		@project = Project.find(params[:id])

		if @project.status != 3
			if @project.status == 3
				flash[:notice] = "Saved..."
			else
				flash[:alert] = "Something went wrong..."
			end

			redirect_to request.referrer
		end
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
      params.require(:project).permit(:estimated_effort, :actual_effort, :display, :name, :status, :description)
    end
end
