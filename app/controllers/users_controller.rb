class UsersController < ApplicationController
  def show
    @user = current_user
    @projects = policy_scope(Project).order(created_at: :desc)
    authorize @user
    @data = user_booking_data.to_json
  end



  def user_booking_data
      {
        datasets: [{
          label: "Staffing employés",
          data: [User.count, User.count - User.with_reservations.length ],
          backgroundColor: ["hsl(44, 60%, 40%)", "hsl(50, 5%, 83%)"]
        }],
        labels: ["Tous les employés", "Les employés disponibles pour une mission"]
      }
  end
end
