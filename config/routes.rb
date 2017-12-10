Rails.application.routes.draw do
  get '/stations/:id/lines', to: 'stations#lines'
  resources :stations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
