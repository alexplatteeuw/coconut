class ReservationsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @project = Project.find(params[:project_id])
    @reservation.project = @project
    authorize @reservation
    @reservation.save

    redirect_to project_path(@project), notice: "You've successfully booked #{@project.name}"
  end

  private

  def reservation_params
    params.require(:reservation).permit(:credits, {skill_list: []})
  end
end
