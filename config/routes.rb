Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "urls#index"

  resources :urls, only: [:create]

  get "/:short_url", to: "urls#show", as: :show
  get "/:short_url/stats", to: "urls#stats", as: :stats
  
end
