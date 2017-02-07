Rails.application.routes.draw do
  resources :courses, only: [:index], defaults: { format: :json }

  # root to: "courses#index"
  root to: 'application#index'
end
