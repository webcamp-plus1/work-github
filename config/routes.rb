Rails.application.routes.draw do
  get 'members/mypage', to: 'members#show'
  resource :members, only: [:edit, :update] do
        resources :carts, only: [:create, :index, :update, :destroy]
        delete :carts, to: 'carts#destroy_all'
  end
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }

  devise_for :members, :controllers => {
    :registrations => 'members/registrations',
    :sessions => 'members/sessions'
  }
  root :to => 'homes#top'
  get 'homes/about', to: 'homes#about'

  namespace :admins do
    get 'admins/member', to: 'members#top', as: 'admin_top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items
    resources :members
    resources :orders, only: [:index, :show, :update]
    resources :order_items, only: [:update]
  end
  get 'members/edit', to: 'members#edit'
  get '/members/unsubscribe' => 'members#unsubscribe_screen', as: 'unsubscribe_screen'
  patch '/members/unsubscribe' => 'members#unsubscribe', as: 'members_unsubscribe'
  get '/genres/:genre_id' => 'items#search' , as: 'item_search'
  resources :items, only: [:index, :show, :create]

  resources :deliveries, only: [:index, :create, :edit, :destroy, :update]

  get 'orders/confirm', to: 'orders#confirm', as: 'order_confirm'
  post 'orders/confirm', to: 'orders#confirm', as: 'order_confirm_post'
  post 'orders/create', to: 'orders#create', as: 'order_create'
  get 'orders/done', to: 'orders#done'
  resources :orders


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
