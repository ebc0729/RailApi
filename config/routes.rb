Rails.application.routes.draw do
  get 'areas/:id/companies', to: 'areas#companies'
  get 'companies/:id/routes', to: 'companies#routes'
  resources :areas
  resources :routes
  resources :stations
  resources :companies
	post '/rails/generates', to: 'rails#generates'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
