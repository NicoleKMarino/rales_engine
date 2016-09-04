Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: {format: :json} do
      get '/merchants/find_all',     to: 'merchants_finder#find_all'
      get '/merchants/find',         to: 'merchants_finder#find'
      resources :merchants, only: [:show, :index] , defaults: {format: :json}
    end
  end
end
