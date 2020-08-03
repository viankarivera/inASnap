Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'home#index'
get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

resources :photoshoots, only: [:index, :show, :new, :create, :edit, :update]

get "/signup", to: "users#new", as: "signup"
post "/signup", to: "users#create"

get "/login", to: "sessions#new", as: "login"
post "/login", to: "sessions#create"

get "/profile", to: "users#show", as: "profile"

resources :sessions 
delete "/logout", to: "sessions#destroy", as: "logout"

resources :users do 
  resources :photoshoots 
  resources :locations
end 


#patch 'photoshoots/:id', to: 'photoshoots#update'
end
