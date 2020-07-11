class ProjectsController < ApplicationController
  def index
    skip_policy_scope
    if params[:q].present?
      @projects = policy_scope(Project).where("name ILIKE ?", "%#{params[:q]}%")
    elsif params[:tag].present?
      @projects = policy_scope(Project).tagged_with(params[:tag])
    end

    if current_user.admin?
      if params[:q].present?
        @projects = policy_scope(Project).where("name ILIKE ?", "%#{params[:q]}%")
      elsif params[:tag].present?
        @projects = policy_scope(Project).tagged_with(params[:tag])
      else
        @projects = policy_scope(Project).order(created_at: :desc)
      end
    else
      @projects = current_user.company.all_favorited
      if params[:q].present?
        @projects = @projects.select {|project| project.name.include? params[:q]}
      elsif params[:tag].present?
        @projects = @projects.select{|project| project.skill_list.include? params[:tag]}
      end
    end

    respond_to do |format|
      format.json { render json: { html: render_to_string(partial: "shared/projects_container", locals: { projects: @projects }, formats: [:html]) } }
      format.html
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
    @employees = @project.users
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

  def completedprojects
    authorize Project.new
    @projects = current_user.projects.where(status: :unstarted)
  end
end
