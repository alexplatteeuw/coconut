class UsersController < ApplicationController
  def show
    @user = current_user
    @projects = policy_scope(Project).order(created_at: :desc)
    authorize @user
    @data_users_availables = user_booking_data.to_json
    @data_skills_availables = user_skills_data.to_json
  end

  def user_booking_data
    user = User.where(company: current_user.company)
    {
      datasets: [{
        label: "Staffing employés",
        data: [user.count, user.count - user.joins(:reservations).group("users.id").length],
        backgroundColor: ["hsl(231, 91%, 58%)", "hsl(50, 5%, 83%)"]
      }],
      labels: ["Tous les employés", "Les employés disponibles pour une mission"]
    }
  end

  def user_skills_data
    user = User.where(company: current_user.company)
    count = []
    labels = []
    user.skill_counts.each { |skill| count << skill.taggings_count }
    user.skill_counts.each { |skill| labels << skill.name }
    {
      datasets: [{
        label: "Staffing employés",
        data: count,
        backgroundColor: ["hsl(231, 91%, 58%)", "hsl(50, 5%, 83%)"]
      }],
      labels: labels
    }
  end
end
