class ProjectsController < ApplicationController
  def index
    skip_policy_scope
    if current_user.admin?
      if params[:q].present?
        sql_query = "name ILIKE :query OR description ILIKE :query"
        @projects = Project.where(sql_query, query: "%#{params[:q]}%").reject { |project| project.status == "completed" }
      elsif params[:tag].present?
        @projects = Project.tagged_with(params[:tag]).uniq.reject { |project| project.status == "completed" }
      else
        @projects = Project.order(created_at: :desc).reject { |project| project.status == "completed" }.reject { |project| current_user.company.favorited?(project) }
      end
    else
      @projects = current_user.company.all_favorited.reject { |project| current_user.projects.include? project }
      if params[:q].present?
        @projects = @projects.select { |project| project.name.include? params[:q] }
      elsif params[:tag].present?
        @projects = @projects.select { |project| project.skill_list.include? params[:tag] }
      end
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
    if @user.company.favorited?(@project)
      @user.company.unfavorite(@project)
    else
      @user.company.favorite(@project)
    end
    redirect_to request.referrer
  end

  def favorites
    authorize Project.new
    # @projects = current_user.company.all_favorited.reject { |project| project.reservations }
    if params[:q].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @projects = Project.where(sql_query, query: "%#{params[:q]}%").select { |project| current_user.company.favorited?(project) }
    elsif params[:tag].present?
      @projects = Project.tagged_with(params[:tag]).uniq.select { |project| current_user.company.favorited?(project) }
    else
      @projects = Project.select { |project| current_user.company.favorited?(project) }
    end

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
    @projects = Project.where(status: :completed)
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
