Rails.application.routes.draw do
  root "lists#index"
  resources :lists do
    resources :notes
  end
end
