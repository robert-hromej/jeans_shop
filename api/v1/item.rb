class JeansShopV1 < Sinatra::Base

  get '/items' do
    Brand.all.to_json
  end

  post '/search' do
    Brand.all.to_json
  end

end