Rails.application.routes.draw do
  resources :users
  resources :notes
  resources :groups
  resources :notebooks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
