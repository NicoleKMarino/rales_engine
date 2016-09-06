Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: {format: :json} do

      get "invoice_items/find_all", to: "invoice_items/find#index"
      get "invoice_items/find", to: "invoice_items/find#show"

      resources :invoice_items, only: [:show, :index] do
        get :invoice
        get :item
      end

      get "invoices/find_all", to: "invoices/find#index"
      get "invoices/find", to: "invoices/find#show"

      resources :invoices, only: [:show, :index] do
        get :transactions
        get :invoice_items
        get :items
        get :customer
        get :merchant
      end

      get "items/find_all", to: "items/find#index"
      get "items/find", to: "items/find#show"

      resources :items, only: [:show, :index] do
        get :invoice_items
        get :merchant
      end

      get '/merchants/find_all',     to: 'merchants/merchants_finder#index'
      get '/merchants/find',         to: 'merchants/merchants_finder#show'
      get '/merchants/random',       to: 'merchants/merchants_finder#random'

      resources :merchants, only: [:show, :index] do
          get :items
          get :invoices
      end

      resources :transactions, only: [:index, :show] do
        get :invoice
      end

      resources :customers, only: [:index, :show] do
        get :invoices
        get :transactions
      end
    end
  end
end
