class EventsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @events = policy_scope(Event).where(project: @project)
    render json: @events.as_json
  end

  def update
    @event = Event.find(params[:id])
    authorize @event
    @event.update(event_params)
  end

  def create
    @project = Project.find(params[:project_id])
    @event = Event.new(event_params)
    @event.project = @project
    @event.user = current_user
    authorize @event
    @event.save
  end

  private

  def event_params
    params.require(:event).permit(:title, :start, :end)
  end
end
