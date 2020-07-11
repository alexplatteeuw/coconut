class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @project = Project.find(params[:project_id])
    @message = Message.new

    authorize @chatroom
  end
end
