Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :api, defaults: {format: :json} do

      resources :real_estates do
        collection do
          get :search
          post :populate_csv
        end
      end
    end
end
