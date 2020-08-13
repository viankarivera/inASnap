Rails.application.routes.draw do
 
  #devise_for :users
    get 'welcome', to: 'static#welcome'

    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'

    get '/users', to: 'users#show'
    post '/users/:id', to: 'users#show'

    delete '/logout', to: 'sessions#destroy'

    get '/photographer/:id', to: 'photographers#show'

    get '/reviews', to: 'reviews#index'
    get '/reviews/new', to: 'reviews#new'
    get '/reviews/:id', to: 'reviews#show', as: 'review'
    post '/reviews', to: 'reviews#create'

    get '/reviews/:id/edit', to: 'reviews#edit'
    patch 'reviews/:id', to: 'reviews#update'


    resources :users, only: [:index]
    resources :photographers do 
      resources :reviews, only: [:new, :create, :index]
    end 
    resources :reviews, only: [:index, :show, :new, :create, :edit, :update]


end
