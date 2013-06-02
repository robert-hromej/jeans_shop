class JeansShopV1 < Sinatra::Base

  get '/categories' do
    Category.all.to_json
  end

  get '/categories/:id' do
    Category.find(params[:id]).to_json
  end

  post '/categories' do
    require_admin
    #  TODO
  end

  put '/categories' do
    require_admin
    #  TODO
  end

end