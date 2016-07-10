module API
  module Ver1
    class Rooms < Grape::API
      format :json
      formatter :json, Grape::Formatter::Jbuilder

      helpers do
        def create_params
          ActionController::Parameters.new(params).permit(:send_user_id, :opponent_user_id)
        end

        def current_user
          if request.headers["Fbid"]
            @current_user ||= User.find_by(facebook_id: request.headers["Fbid"])
          end
          return @current_user
        end
      end

      desc 'GET /api/v1/rooms/index'
      get 'rooms/index', jbuilder: 'api/ver1/rooms/index' do
        @rooms = Room.where(send_user_id: current_user.facebook_id)
        @rooms = Room.convert_hash_from_rooms(@rooms, current_user.facebook_id)
      end

      desc 'POST /api/v1/rooms/create'
      post 'rooms/create', jbuilder: 'api/ver1/rooms/create' do
        if Room.isExistRoom(params[:send_user_id], params[:opponent_user_id])
          @room = Room.where(create_params).first
          @messages = @room.get_message(params[:send_user_id])
        else
          @room = Room.create(create_params)
        end
      end

    end
  end
end