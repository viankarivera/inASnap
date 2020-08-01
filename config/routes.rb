Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :photoshoots, only: [:index, :show, :new, :create, :edit, :update]
get "/signup", to: "users#new"
post "/signup", to: "users#create"

get "/login", to: "sessions#new", as: "login"
post "/login", to: "sessions#create"

#patch 'photoshoots/:id', to: 'photoshoots#update'
end
