module API
  module Ver1
    class Users < Grape::API
      format :json
      formatter :json, Grape::Formatter::Jbuilder

      helpers do
        def create_params
          ActionController::Parameters.new(params).permit(:facebook_id, :age, :gender, :name, :latitude, :longitude, :login_time)
        end

        def update_params
          ActionController::Parameters.new(params).permit(:id, :age, :name, :latitude, :longitude, :login_time, :work, :school, :greeting)
        end

        def current_user
          if request.headers["Fbid"]
            @current_user ||= User.find_by(facebook_id: request.headers["Fbid"])
          end
          return @current_user
        end
      end

      desc 'GET /api/v1/users'
      get '/users', jbuilder: 'api/ver1/users/index' do
        blocking_users = User.get_blocking_users(current_user.facebook_id)
        except_user = User.where.not(id: current_user.id) - blocking_users
        @users_distances = User.get_distance_users(current_user, except_user)
      end

      desc 'POST /api/v1/users/create'
      post '/users/create', jbuilder: 'api/ver1/users/create' do
        if User.isRegisterBefore(params[:facebook_id])
          @user = User.where(facebook_id: params[:facebook_id])[0]
        else
          @user = User.create(create_params)
        end
      end

      desc 'GET /api/v1/users/:id'
      get '/users/:id', jbuilder: 'api/ver1/users/show' do
        @user = User.find(params[:id])
      end

      desc 'PUT /api/v1/users/:id/'
      put '/users/:id', jbuilder: 'api/ver1/users/update' do
        @user = User.find(params[:id])
        @user.update(update_params)
      end

      desc 'POST /api/v1/users/block/:id'
      post '/users/block/:id' do
        BlockUser.where(user_id: current_user.facebook_id, blocked_user_id: params[:id]).first_or_create
      end

    end
  end
end