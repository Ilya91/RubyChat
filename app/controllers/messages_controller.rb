class MessagesController < ApplicationController
  def new
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
