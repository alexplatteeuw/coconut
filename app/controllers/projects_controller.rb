class ProjectsController < ApplicationController
  def index
    if params[:q].present?
      @projects = policy_scope(Project).where("name ILIKE ?", "%#{params[:q]}%")
    else
      @projects = policy_scope(Project).order(created_at: :desc)
    end
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
  end
end
