Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'boards#index'
  
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  post 'books/search', to: 'books#create'
  delete 'books/reset', to: 'books#destroy'

  get 'books/search', to: 'boards#new'
  
  resources :boards, only: [:index, :show, :new, :create] do
    resources :comments, only: [:new, :create, :destroy]
  end
end
