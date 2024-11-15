Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :lists, only: [:index, :new, :show, :create] do
    resources :bookmarks, only: [:new, :create]
  end

end
