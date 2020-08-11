Rails.application.routes.draw do
 
    get 'welcome', to: 'static#welcome'

    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'

    delete '/logout', to: 'sessions#destroy'

    get '/photographer/:id', to: 'photographers#show'

    get '/reviews', to: 'reviews#show'
    get '/reviews/:id/edit', to: 'reviews#edit'
    patch 'reviews/:id', to: 'reviews#update'


    resources :photographers
    resources :users 
    resources :reviews, only: [:index, :show, :new, :create, :edit, :update]
end
