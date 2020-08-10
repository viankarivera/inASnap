Rails.application.routes.draw do
 
    get 'welcome', to: 'static#welcome'

    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'

    get '/photographer/:id', to: 'photographers#show'


    resources :photographers
    resources :users 
    resources :reviews
end
