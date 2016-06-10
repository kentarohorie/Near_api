module API
  module Ver1
    class Users < Grape::API
      format :json
      formatter :json, Grape::Formatter::Jbuilder
      #/api/v1/users
      get '/users', jbuilder: 'api/ver1/users/index' do
        @users = User.all
      end

    end
  end
end