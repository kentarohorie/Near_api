class ChatController < WebsocketRails::BaseController
  def create
    message = Message.new
    send_message :create_success, message
  end
end