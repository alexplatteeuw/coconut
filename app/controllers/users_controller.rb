class UsersController < ApplicationController
  def show
    @user = current_user
    @projects = policy_scope(Project).order(created_at: :desc)
    authorize @user
  end

  def user_booking_data
      {
        datasets: [{
          label: "Staffing employés",
          data: [Machine.sold.length, Machine.count - Machine.sold.length],
          backgroundColor: ["hsl(44, 60%, 40%)", "hsl(50, 5%, 83%)"]
        }],
        labels: ["En mission", "Disponible"]
      }
  end
end
