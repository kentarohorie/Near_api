module API
  module Ver1
    class Messages < Grape::API
      format :json
      formatter :json, Grape::Formatter::Jbuilder

      helpers do
        def create_params
          ActionController::Parameters.new(params).permit(:message, :user_id, :room_id)
        end

        def current_user
          if request.headers["Fbid"]
            @current_user ||= User.find_by(facebook_id: request.headers["Fbid"])
          end
          return @current_user
        end
      end

      desc 'POST /api/v1/messages/create'
      post 'messages/create', jbuilder: 'api/ver1/messages/create' do
        Message.create(create_params)
      end

    end
  end
end