class JeansShopV1 < Sinatra::Base

  get '/brands' do
    Brand.all.to_json
  end

  get '/brands/:id' do
    Brand.find(params[:id]).to_json
  end

end