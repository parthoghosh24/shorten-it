Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  mount GrapeSwaggerRails::Engine, at: "/apidoc"
  root to: "urls#index"

  resources :urls, only: [:create]

  get "/:short_url", to: "urls#show", as: :show
  get "/:short_url/stats", to: "urls#stats", as: :stats
  mount API::Base => '/'
  
  
end
