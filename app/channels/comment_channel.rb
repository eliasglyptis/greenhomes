class CommentChannel < ApplicationCable::Channel
  def subscribed
    project = Project.find params[:project]
    stream_for project
  end
end
