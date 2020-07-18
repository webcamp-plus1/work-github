Rails.application.routes.draw do
  resource :members, only: [:edit, :show, :update]
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }
  
  devise_for :members
  root :to => 'homes#top'
  get 'homes/about', to: 'homes#about'

  namespace :admins do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items
  end


  get '/members/unsubscribe' => 'members#unsubscribe_screen', as: 'unsubscribe_screen'
  patch '/members/unsubscribe' => 'members#unsubscribe', as: 'members_unsubscribe'



  resources :deliveries, only: [:index, :create, :edit, :destroy, :update]

  resources :items, only: [:index, :show, :create] do 
      resources :carts, only: [:create, :index, :update, :destroy]
  end

  resources :oreders

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
