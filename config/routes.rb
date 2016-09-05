Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: {format: :json} do

      namespace :invoice_items do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
      end

      resources :invoices, only: [:show, :index]

      namespace :invoice do

        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
      end

      resources :invoice_items, only: [:show, :index]

      namespace :items do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
      end

      resources :items, only: [:show, :index]
      resources :merchants, only: [:show, :index] do
        collection do
          get :find
          get :find_all
        end
      end
    end
  end
end
