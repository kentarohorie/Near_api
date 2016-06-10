module API
  class Root < Grape::API
    mount API::Ver1::Root #バージョン振り分け
  end
end