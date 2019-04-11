Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :groups
    end 
  end 

  namespace :api do
    namespace :v1 do
      resources :notebooks do 
        resources :notes
      end
    end
  end
end
