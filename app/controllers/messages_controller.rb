class MessagesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      @chatroom = Chatroom.find(params[:chatroom_id])
      @message = Message.new(message_params)
      @message.chatroom = @chatroom
      @message.user = current_user
      @project = Project.find(params[:project_id])
      authorize @message
      @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
    end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
