Rails.application.routes.draw do
  root to: "guides#index"

  resources :guides
  resource  :sessions, only: [ :create, :destroy ]
end
