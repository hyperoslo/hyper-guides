Rails.application.routes.draw do
  root to: "pages#index"

  resources :guides, only: [ :new, :create, :show ]
end
