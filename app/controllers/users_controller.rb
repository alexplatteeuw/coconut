class UsersController < ApplicationController
  def show
    @user = current_user
    @projects = policy_scope(Project).order(created_at: :desc)
    authorize @user
    @data_users_availables = user_booking_data.to_json
    @data_skills_availables = user_skills_data.to_json
    @data_projects_status = projects_status.to_json
  end

  def user_booking_data
    user = User.where(company: current_user.company)
    unavailable_user = user.joins(:reservations).group("users.id")
    {
      labels: ["Employés en mission", "Employés disponibles pour une mission"],
      datasets: [{
        data: [unavailable_user.length, user.length - unavailable_user.length],
        backgroundColor: ["hsl(231, 91%, 58%)", "hsl(50, 5%, 83%)"]
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
        backgroundColor: ["hsl(231, 91%, 58%)", "hsl(50, 5%, 83%)"]
      }]
    }
  end

  def projects_status
    unstarted_projects = Project.where(status: "unstarted")
    current_projects = Project.where(status: "current")
    completed_projects = Project.where(status: "completed")

    {
      datasets: [
        {
          label: "Projets à lancer",
          data: [unstarted_projects.count],
          backgroundColor: ["hsl(231, 91%, 58%)"]
        },
        {
          label: "Projets en cours",
          data: [current_projects.count],
          backgroundColor: ["hsl(50, 5%, 66%)"]
        },
        {
          label: "Projets terminés",
          data: [completed_projects.count],
          backgroundColor: ["hsl(50, 5%, 83%)"]
        }
      ]
    }
  end
end
