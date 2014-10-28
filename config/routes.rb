Rails.application.routes.draw do
  root to: "pages#index"

  resources :guides, only: :show
end
