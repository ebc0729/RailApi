Rails.application.routes.draw do
  resources :stations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/rails/', to: 'rails#index'
end
