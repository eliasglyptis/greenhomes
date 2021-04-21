class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_valid_project

  def create
    project = Project.find(comment_params[:project_id])

    if comment_params[:content].blank?
      return render json: {success: false}     
    end

    @comment = Comment.new(
      user_id: current_user.id,
      project_id: project.id,
      content: comment_params[:content],
    )

    if @comment.save
      CommentChannel.broadcast_to project, message: render_comment(@comment)
      return render json: {success: true}
    else  
      return render json: {success: false}
    end
  end
  


  private
    def render_comment(comment)
      self.render_to_string partial: 'projects/comment', locals: {comment: comment}
    end
    def comment_params
      params.require(:comment).permit(:content, :project_id)
    end
    def is_valid_project
      redirect_to dashboard_path, alert: 'Invalid project' unless Project.find(comment_params[:project_id]).present?
    end
end