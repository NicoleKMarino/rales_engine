Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: {format: :json} do

      get "invoice_items/find_all", to: "invoice_items/find#index"
      get "invoice_items/find", to: "invoice_items/find#show"
      get "invoice_items/random", to: "invoice_items/random#show"
      get 'invoice_items/:id/invoice', to: "invoice_items/invoices#show"
      get 'invoice_items/:id/item', to: "invoice_items/items#show"

      resources :invoice_items, only: [:show, :index]

      get "invoices/find_all", to: "invoices/find#index"
      get "invoices/find", to: "invoices/find#show"
      get "invoices/random", to: "invoices/random#show"
      get 'invoices/:id/transactions', to: "invoices/transactions#index"
      get 'invoices/:id/items', to: "invoices/items#index"
      get 'invoices/:id/customer', to: "invoices/customers#show"
      get 'invoices/:id/merchant', to: "invoices/merchants#show"
      get 'invoices/:id/invoice_items', to: "invoices/invoice_items#index"

      resources :invoices, only: [:show, :index]

      get "items/find_all", to: "items/find#index"
      get "items/find", to: "items/find#show"
      get "items/random", to: "items/random#show"
      get "items/:id/invoice_items", to: "items/invoice_items#index"
      get "items/:id/merchant", to: "items/merchants#index"
      get "items/:id/best_day", to: "items/best_day#show"
      get "items/most_revenue", to: "items/most_revenue#index"
      get "items/most_items", to: "items/most_items#index"

      resources :items, only: [:show, :index]

      get '/merchants/find_all',     to: 'merchants/merchants_finder#index'
      get '/merchants/find',         to: 'merchants/merchants_finder#show'
      get '/merchants/random',       to: 'merchants/random#show'
      get '/merchants/:id/items', to: 'merchants/items#index'
      get '/merchants/:id/invoices', to: 'merchants/invoices#index'
      get '/merchants/:id/revenue', to: 'merchants/revenue#show'
      get '/merchants/:id/customers_with_pending_invoices', to: 'merchants/customers_with_pending_invoices#show'
      get '/merchants/:id/favorite_customer', to: 'merchants/favorite_customer#show'
      get '/merchants/most_revenue', to: 'merchants/most_revenue#show'

      resources :merchants, only: [:show, :index]

      get '/transactions/find_all', to: "transactions/find#index"
      get "/transactions/find", to: "transactions/find#show"
      get "/transactions/random", to: "transactions/random#show"
      get 'transactions/:id/invoice', to: "transactions/invoices#show"

      resources :transactions, only: [:index, :show]

      get '/customers/find_all', to: 'customers/find#index'
      get '/customers/find', to: 'customers/find#show'
      get '/customers/random', to: 'customers/random#show'
      get '/customers/:id/invoices', to: "customers/invoices#index"
      get '/customers/:id/transactions', to: "customers/transactions#index"

      resources :customers, only: [:index, :show]
    end
  end
end
