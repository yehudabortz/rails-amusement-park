Rails.application.routes.draw do
  get '/users/new', to: 'users#new', as: 'new_user'

  get 'signin', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'
  
  post '/attractions/:id', to: 'attractions#create'
  
  # resources :sessions
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  resources :attractions
  resources :rides

  root to: 'welcome#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
