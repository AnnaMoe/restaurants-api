Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # thanks to namespace convention, you won't have conflict with the html restaurants controller
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :restaurants, only: [ :index ]
    end
  end
end
