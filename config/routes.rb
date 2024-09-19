Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, controllers: {
    confirmations: "users/confirmations",
    sessions: "users/sessions",
    registrations: "users/registrations"
    }

  # Route for viewing all users
  resources :users, only: [ :index ] do
    # Nested resource for profiles under users
    resources :profiles, only: [ :new, :show, :edit, :update ]
  end

  # Route for creating profiles
  resources :profiles, only: [ :create ]

  # admin user routes
  #   # Admin-only routes
  authenticated :user, ->(u) { u.admin? } do
    resources :users, only: [ :index ]
    resources :profiles, only: [ :new, :create, :edit, :update, :show ]
  end

  # Catch-all route for non-existent pages, to be used unless assets are being compiled
  match "*path", via: :all, to: "application#not_found", constraints: lambda { |req|
    req.path.exclude? "rails/active_storage"
}

root to: "home#index"
end
