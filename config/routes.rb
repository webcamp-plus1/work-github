Rails.application.routes.draw do
  get 'deliveries/index'
  get 'deliveries/create'
  get 'deliveries/destroy'
  get 'deliveries/edit'
  get 'deliveries/update'
  get 'orders/new'
  get 'orders/cnfirm'
  get 'orders/create'
  get 'orders/done'
  get 'orders/index'
  get 'orders/show'
  get 'carts/create'
  get 'carts/index'
  get 'carts/update'
  get 'carts/destroy'
  get 'carts/all_destroy'
  get 'items/index'
  get 'items/show'
  devise_for :members
  root :to => 'homes#top'
  get 'homes/about', to: 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
