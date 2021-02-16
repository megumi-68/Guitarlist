Rails.application.routes.draw do
  root to: 'toppages#index'
  
  post 'guest', to: 'guest_sessions#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  delete 'destroy_user', to: 'users#destroy'
  get 'signup', to: 'users#new'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :guitars do
  get :search, on: :collection
 end
  
  resources :guitars, only: [:new, :show, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
