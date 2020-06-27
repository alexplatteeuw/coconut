class ProjectsController < ApplicationController
  def index
    @projects = policy_scope(Project).order(created_at: :desc)
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
  end
end
