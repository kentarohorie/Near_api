module API
  module Ver1
    class Users < Grape::API
      format :json
      formatter :json, Grape::Formatter::Jbuilder

      helpers do
        def create_params
          ActionController::Parameters.new(params).permit(:facebook_id, :age, :gender, :name)
        end
      end

      desc 'GET /api/v1/users'
      get '/users', jbuilder: 'api/ver1/users/index' do
        @users = User.all
      end

      desc 'POST /api/v1/users/create'
      post '/users/create', jbuilder: 'api/ver1/users/create' do
        @user = User.create(create_params)
      end

    end
  end
end