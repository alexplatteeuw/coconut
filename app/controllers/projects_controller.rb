class ProjectsController < ApplicationController
  def index
    if params[:q].present?
      @projects = policy_scope(Project).where("name ILIKE ?", "%#{params[:q]}%")
    else
      @projects = policy_scope(Project).order(created_at: :desc)
    end
  end

  def favorites
    # skip_authorization
    authorize Project.new
    @projects = current_user.company.all_favorited
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
  end

  def favorite
    @user = current_user
    @project = Project.find(params[:id])
    authorize @project
    if @user.company.favorited?(@project)
      @user.company.unfavorite(@project)
    else
      @user.company.favorite(@project)
    end
    redirect_to projects_path
  end
end
