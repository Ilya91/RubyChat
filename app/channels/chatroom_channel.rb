class ChatChannel < ApplicationCable::Channel
  # Called when the consumer has successfully
  # become a subscriber to this channel.
  def subscribed
    stream_for 'chatroom_channel'
  end

  def unsubscribed

  end
end