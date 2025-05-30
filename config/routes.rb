Rails.application.routes.draw do
  resources :orders
  resources :line_items, only: [ :create, :update, :destroy ]
  resources :carts, only: %i[ show destroy ]
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :products do
    resources :subscribers, only: [ :create ]
    resources :reviews, only: [ :new, :create ]
    resources :carts, only: [ :create ]
    get :who_bought, on: :member, defaults: { format: :atom }
  end

  resources :line_items, only: [ :create ]
  resources :users
  resource :unsubscribe, only: [ :show ]

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "products#index"
end
