Rails.application.routes.draw do
  get 'results/index'

  root to: 'toppages#index'
  get '/toppages', to:'toppages#index'
  get 'comments/create'



  resources :maps do
    resources :prefs
  end

  get '/login',to: 'sessions#new'
  post'/login',to:'sessions#create'
  delete '/logout',to: 'sessions#destroy'

  
resources :users
  namespace :admin do
    resources :users
  end

  resources :votes

  resources :blogs do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
