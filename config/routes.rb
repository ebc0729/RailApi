Rails.application.routes.draw do
  get 'areas/:id/companies', to: 'areas#companies'
  resources :areas
  resources :stations
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
