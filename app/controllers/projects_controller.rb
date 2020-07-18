class ProjectsController < ApplicationController
  def index
    skip_policy_scope

    if current_user.admin?
      find_projects(Project.created)
    else
      find_projects(Project.preselected)
    end

    respond_to do |format|
      format.json { render json: { html: render_to_string(partial: "shared/projects_container", locals: { projects: @projects }, formats: [:html]) } }
      format.html
    end
  end

  def favorite
    @user = current_user
    @project = Project.find(params[:id])
    authorize @project
    if @project.status == "created"
      @project.update(status: "preselected")
    elsif @project.status == "preselected"
      @project.update(status: "created")
    end
    redirect_to request.referrer
  end

  def favorites
    authorize Project.new
    find_projects(Project.preselected)

    respond_to do |format|
      format.json { render json: { html: render_to_string(partial: "shared/projects_container", locals: { projects: @projects }, formats: [:html]) } }
      format.html
    end
  end

  def myprojects
    authorize Project.new
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
    @user = current_user
    @employees = @project.users
    @reservation = Reservation.new
    @project.chatroom = Chatroom.new if @project.chatroom.nil?
    authorize @project
  end

  def completedprojects
    authorize Project.new
    @projects = current_user.projects.created
  end

  def update
    @project = Project.find(params[:id])
    authorize @project
    @project.update(project_params)
    if @project.save!
      redirect_to project_path(@project)
    else
      render dashboard_path
    end
  end

  private

  def project_params
    params.require(:project).permit("status", documents: [])
  end

  def find_projects(projects)
    sql_query = "name ILIKE :query OR description ILIKE :query"
    if params[:q].present?
      @projects = projects.where(sql_query, query: "%#{params[:q]}%")
    elsif params[:tag].present?
      @projects = projects.tagged_with(params[:tag]).uniq
    else
      @projects = projects.order(created_at: :desc)
    end
  end
end
