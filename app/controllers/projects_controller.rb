class ProjectsController < ApplicationController
  def index
    skip_policy_scope
    if params[:q].present?
      @projects = policy_scope(Project).where("name ILIKE ?", "%#{params[:q]}%")
    else
      if current_user.admin?
        @projects = policy_scope(Project).order(created_at: :desc)
      else
        @projects = current_user.company.all_favorited
      end
    end
  end

  def favorites
    # skip_authorization
    authorize Project.new
    @projects = current_user.company.all_favorited
  end

  def myprojects
    authorize Project.new
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
    @user = current_user
    @employees = @user.company.users
    @reservation = Reservation.new
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
    redirect_to request.referrer
  end
end
