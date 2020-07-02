class ProjectsController < ApplicationController
  def index
    if params[:q].present?
      @projects = policy_scope(Project).where("name ILIKE ?", "%#{params[:q]}%")
    else
      @projects = policy_scope(Project).order(created_at: :desc)
    end
  end

  def favorites
    @projects = policy_scope(Project).order(created_at: :desc)
    authorize @projects
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
  end

  def favorite
    @user = current_user
    @project = Project.find(params[:id])
    authorize @project
    if @user.favorited?(@project)
      @user.unfavorite(@project)
    else
      @user.favorite(@project)
    end
    redirect_to projects_path
  end
end
