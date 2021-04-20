class PagesController < ApplicationController
  def home
    @projects = Project.all.where(display: 'Public')
  end
end
