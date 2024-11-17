Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :lists do
    resources :bookmarks, only: [:new, :create, :destroy ]
  end

  root to: 'lists#index'
end
