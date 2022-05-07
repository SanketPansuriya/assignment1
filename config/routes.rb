Rails.application.routes.draw do
  resources :sectors
  resources :industries
  resources :appointments
  resources :physicians
  resources :patients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
