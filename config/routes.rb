Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :merchants, only: [:show, :index] do
        collection do
          get :find
          get :find_all
        end
      end

  end
end

end
