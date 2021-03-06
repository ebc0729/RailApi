Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  get 'areas/:id/companies', to: 'areas#companies'
  get 'companies/:id/routes', to: 'companies#routes'
  get 'routes/:id/stations', to: 'routes#stations'
  
  resources :areas
  resources :routes
  resources :stations
  resources :companies
  resources :users
	post '/rails/generates', to: 'rails#generates'
  post '/records', to: 'records#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/auth/registrations'
    }
  end
end
