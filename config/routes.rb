Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      
      resources :users, only: [:create]
      
      resources :clients do
        resources :duedates
      end

      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      
    end
  end
end