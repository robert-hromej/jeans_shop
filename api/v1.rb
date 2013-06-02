class JeansShopV1 < Sinatra::Base
  set :root, "#{File.dirname(__FILE__)}/v1"

  #error ActiveRecord::RecordNotFound do
  #  halt 404, 'Record not found'
  #end

  helpers do
    def require_auth
      halt 401, 'Access denied. Unauthorized.' unless current_user
    end

    def require_admin
      halt 550, 'Access denied.' unless admin?
    end

    def current_user
      #  TODO
    end

    def admin?
      #  TODO
    end
  end

end