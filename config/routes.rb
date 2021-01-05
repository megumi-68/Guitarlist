Rails.application.routes.draw do
  
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
 
  get 'signup', to: 'users#new'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'guitars/new', to: 'guitars#new'
  post 'guitars', to: 'guitars#create'
  
  resources :guitars, only: [:show, :create, :destroy, :edit, :update]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]

end
