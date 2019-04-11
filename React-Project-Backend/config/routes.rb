Rails.application.routes.draw do
  # resources :user_groups
  # resources :users
  # resources :notes
  # resources :groups
  # resources :notebooks
  namespace :api do
    namespace :v1 do
      resources :notebooks do 
        resources :notes
      end
    end
  end
end
