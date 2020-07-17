Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }
  devise_for :members
  root :to => 'homes#top'
  get 'homes/about', to: 'homes#about'

  resource :member
  get 'member/mypage', to: 'members#show'

  resources :deliveries, only: [:index, :create, :edit, :destroy, :update]
  
  resources :carts, only: [:create, :index, :update, :destroy]


  resources :items, only: [:index, :show]
  resources :oreders

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
