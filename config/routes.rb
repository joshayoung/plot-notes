Rails.application.routes.draw do
  root "homes#index"
  get "archived-notes", to: "homes#archived_notes"
  get "completed-notes", to: "homes#completed_notes"
  resources :lists do
    member do
      get "archived"
      get "completed"
      get "archived-notes"
      get "completed-notes"
    end
    resources :notes do
      resources :tags
      post :archive, on: :member
      post :complete, on: :member
    end
  end
end
