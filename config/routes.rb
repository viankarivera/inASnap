Rails.application.routes.draw do
 
  devise_for :users
    get 'welcome', to: 'static#welcome'

    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'

    delete '/logout', to: 'sessions#destroy'

    get '/photographer/:id', to: 'photographers#show'

    get '/reviews', to: 'reviews#index'
    get '/reviews/new', to: 'reviews#new'
    post '/reviews', to: 'reviews#create'

    get '/reviews/:id/edit', to: 'reviews#edit'
    patch 'reviews/:id', to: 'reviews#update'


    resources :photographers
    resources :users

    resources :users do 
      resources :reviews, only: [:index, :create, :edit, :update]
    end 
    
    resources :photographers do 
        resources :reviews, only: [:index, :new, :create]
    end 
    resources :reviews, only: [:index, :show, :new, :create, :edit, :update]
end
