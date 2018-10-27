Rails.application.routes.draw do
  
  get 'users/index'

  resources :maps

  get '/login',to: 'sessions#new'
  post'/login',to:'sessions#create'
  delete '/logout',to: 'sessons#destroy'

  
resources :users
  namespace :admin do
    resources :users
  end

  root to: 'blogs#index'
  resources :blogs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
