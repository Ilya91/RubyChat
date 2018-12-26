class ChatChannel < ApplicationCable::Channel
  include ApplicationHelper
  def subscribed
    stream_from "room"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_msg(data)
    ActionCable.server.broadcast "room", message:data['message']
    @message = Message.new(body: data['message'], user_id: 1)
    @message.save
  end
end