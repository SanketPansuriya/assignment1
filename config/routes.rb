Rails.application.routes.draw do
  namespace :has_many_through do
    resources :appointments
    resources :physicians
    resources :patients
    root "appointments#index"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
