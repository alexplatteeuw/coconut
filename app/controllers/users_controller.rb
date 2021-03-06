class UsersController < ApplicationController
  def show
    @user = current_user
    @projects = policy_scope(Project).order(created_at: :desc)
    @myprojects = current_user.projects
    authorize @user
    @data_users_availables = user_booking_data.to_json
    @data_skills_availables = user_skills_data.to_json
    @data_projects_status = projects_status.to_json
    @data_user_projects_status = user_projects_status.to_json
  end

  def user_booking_data
    user = User.where(company: current_user.company)
    unavailable_user = user.joins(:reservations).group("users.id")
    {
      labels: ["Employés en mission", "Employés disponibles pour une mission"],
      datasets: [{
        data: [unavailable_user.length, user.length - unavailable_user.length],
        backgroundColor: ["#DDE0F3", "#3351F5"]
      }]
    }
  end

  def user_skills_data
    user = User.where(company: current_user.company)
    count = []
    labels = []
    user.skill_counts.each { |skill| count << skill.taggings_count }
    user.skill_counts.each { |skill| labels << skill.name }

    {
      labels: labels,
      datasets: [{
        data: count,
        backgroundColor: ["#3351F5","#3386FF", "#265AB5", "#0E4AB2","#0E33B2", "#85BBE5", "#71A1D1"]
      }]
    }
  end

  def projects_status
    unstarted_projects = Project.where(status: :created)
    current_projects = Project.where(status: :pending)
    completed_projects = Project.where(status: :completed)

    {
      labels: [""],
      datasets: [
        {
          label: "Projets à lancer",
          data: [unstarted_projects.count],
          backgroundColor: ["#3351F5"]
        },
        {
          label: "Projets en cours",
          data: [current_projects.count],
          backgroundColor: ["#DDE0F3"]
        },
        {
          label: "Projets terminés",
          data: [completed_projects.count],
          backgroundColor: ["grey"]
        }
      ]
    }
  end

  def user_projects_status
    unstarted_projects = @myprojects.where(status: :created)
    current_projects = @myprojects.select { |project| !project.reservations.empty? && project.status != "completed" }
    completed_projects = @myprojects.select { |project| !project.reservations.empty? && project.status == "completed" }

    {
      labels: [""],
      datasets: [
        {
          label: "Projets auxquels postuler",
          data: [unstarted_projects.count],
          backgroundColor: ["#3351F5"]
        },
        {
          label: "Projets en cours",
          data: [current_projects.count],
          backgroundColor: ["#DDE0F3"]
        },
        {
          label: "Projets terminés",
          data: [completed_projects.count],
          backgroundColor: ["grey"]
        }
      ]
    }
  end
end
