Rails.application.routes.draw do
  root to: 'toppages#index'

  resources :maps

  get '/login',to: 'sessions#new'
  post'/login',to:'sessions#create'
  delete '/logout',to: 'sessons#destroy'

  
resources :users
  namespace :admin do
    resources :users
  end

  resources :votes

  root to: 'blogs#index'
  resources :blogs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
