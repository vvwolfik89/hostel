Rails.application.routes.draw do
  resources :motels
  resources :countries
  resources :towns
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  delete "attachments/:id/purge", to: "attachments#purge", as: "purge_attachment"
  # get "hostels", to: "hostels#index"

  # Defines the root path route ("/")
  root "motels#index"
end
