Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'authenticate', to: 'authentication#authenticate'
      get 'search/flight', to: 'search#flight'

      resources :passengers, only: [:index, :create, :show]
    end
  end
end
