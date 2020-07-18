class ProjectsController < ApplicationController
  def index
    skip_policy_scope
    sql_query = "name ILIKE :query OR description ILIKE :query"

    if current_user.admin?
      find_projects(created)
    else
      find_projects(created)
    end

    respond_to do |format|
      format.json { render json: { html: render_to_string(partial: "shared/projects_container", locals: { projects: @projects }, formats: [:html]) } }
      format.html
    end
  end

  def find_projects(status)
    if params[:q].present?
      @projects = Project."#{status}".where(sql_query, query: "%#{params[:q]}%")
    # ou qu'il recherche par tag
    elsif params[:tag].present?
      @projects = Project.status.tagged_with(params[:tag]).uniq
    # autrement : afficher tous les projets
    else
      @projects = Project.status.order(created_at: :desc)
    end
  end

  def favorites
    authorize Project.new
    @projects = Project.preselected
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
end
