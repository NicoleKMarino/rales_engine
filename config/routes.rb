Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: {format: :json} do

      get "invoice_items/find_all", to: "invoice_items/find#index"
      get "invoice_items/find", to: "invoice_items/find#show"

      resources :invoice_items, only: [:show, :index]

      get "invoices/find_all", to: "invoices/find#index"
      get "invoices/find", to: "invoices/find#show"

      resources :invoices, only: [:show, :index]

      get "items/find_all", to: "items/find#index"
      get "items/find", to: "items/find#show"

      resources :items, only: [:show, :index]

      get '/merchants/find_all',     to: 'merchants/merchants_finder#index'
      get '/merchants/find',         to: 'merchants/merchants_finder#show'
      get '/merchants/random',       to: 'merchants/merchants_finder#random'
      resources :merchants, only: [:show, :index] do
          get :items
      end
    end
  end
end
