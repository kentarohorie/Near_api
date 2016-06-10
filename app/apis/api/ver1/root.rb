
# 本来APIファイル１つでいいが、設定ファイル的な意味合い。一度読み込まれれば良いのだろう
module API
  module Ver1
    class Root < Grape::API
      prefix :api
      version 'v1', using: :path #api/v1
      format :json
      formatter :json, Grape::Formatter::Jbuilder

      mount API::Ver1::Users

      route :any, '*path' do
        error! I18n.t('grape.errors.not_found'), 404
      end
    end
  end
end
