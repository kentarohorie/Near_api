WebsocketRails::EventMap.describe do
  namespace :chat do
    subscribe :create, :to => ChatController, :with_method => :create
  end
end
