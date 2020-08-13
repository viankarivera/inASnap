Rails.application.routes.draw do


  resources :sessions
  resources :users do 
    resources :reviews 
  end 
  resources :users do 
    resources :photographers 
  end 
  resources :photographers do
    resources :reviews, :only => [:create, :show]
  end 
  resources :reviews  
  resources :photographers, :except => [:create, :edit, :delete]
 
  #devise_for :users
  get 'welcome', to: 'static#welcome'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  get '/users', to: 'photographers#index'
  post '/users/:id', to: 'photographers#index'
  
  delete '/logout', to: 'sessions#destroy'
=begin

    get '/photographer/:id', to: 'photographers#show'
    #get '/reviews/photographers/:id', to: 'photographers#show'

    get '/photographers/:photographer_id/reviews', to: 'photographers#show'
    post '/photographers/:photographer_id/reviews' => CREATE
    

    get '/reviews', to: 'reviews#index'
    get '/reviews/new', to: 'reviews#new'
    get '/reviews/:id', to: 'reviews#show', as: 'review'
    post '/reviews', to: 'reviews#create'


    get '/reviews/:id/edit', to: 'reviews#edit'
    patch 'reviews/:id', to: 'reviews#update'
=end 

   # resources :users, only: [:index]
    #resources :photographers do 
     # resources :reviews, only: [:new, :create, :index]
    #end 
    #resources :reviews, only: [:index, :show, :new, :create, :edit, :update]


end
