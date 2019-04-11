Rails.application.routes.draw do
  # resources :user_groups
  # resources :users
  # resources :notes
  # resources :groups
  # resources :notebooks
  namespace :api do
    namespace :v1 do
      resources :notes, only: [:index, :update]
    end
  end
end
