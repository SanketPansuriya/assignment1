Rails.application.routes.draw do
  namespace :has_many_through do
    resources :appointments
    resources :physicians
    resources :patients
    root "appointments#index"
  end
  
  namespace :has_and_belongs_to_many do
    resources :sectors
    resources :industries
    root "industries#index"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#index"
end
