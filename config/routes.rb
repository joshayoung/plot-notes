Rails.application.routes.draw do
  root "lists#index"
  resources :lists do
    resources :notes do
      post :archive, on: :member
      post :complete, on: :member
    end
  end
end
