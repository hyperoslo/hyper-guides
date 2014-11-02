Rails.application.routes.draw do
  root to: "pages#index"

  resources :guides
  resource  :sessions, only: [ :create, :destroy ]
end
