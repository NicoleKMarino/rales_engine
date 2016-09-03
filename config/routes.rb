Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get 'api/v1/merchants/find/:name' => 'merchants#show'
get 'api/v1/merchants/find_all' => 'merchants#index'

get 'api/v1/merchants.json' => 'merchants#index'
get "api/v1/merchants:id.json" => 'merchants#show'
get "api/v1/merchants/random.json" => 'merchants#random_show'

end
