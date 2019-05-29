Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      
      resources :users, only: [:create]
      
      resources :clients do
        resources :duedates
      end

      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'

      post '/clients/csv', to: 'clients#csv'

      get '/duedates', to: 'duedates#getAll'
      post '/duedates/createMany', to: 'duedates#createMany'
      
    end
  end
end