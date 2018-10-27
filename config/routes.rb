Rails.application.routes.draw do
  
  resources :maps

  get '/login',to: 'sessions#new'
  post'/login',to:'sessions#create'
  delete '/logout',to: 'sessons#destroy'

  

  namespace :admin do
    resources :users
  end

  root to: 'blogs#index'
  resources :blogs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
