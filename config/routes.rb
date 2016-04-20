Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'static_pages#home'

  get 'help'                  => 'static_pages#help'
  get 'about'                 => 'static_pages#about'
  get 'contact'               => 'static_pages#contact'

  resources :line_items do
    match :qty, action: :qty, via: [:post, :delete], on: :member #-> url.com/line_items/qty
    match :input_field_change, action: :input_field_change, via: :post, on: :member
  end
  resources :carts do
    match :empty_line_items, action: :empty_line_items, via: :delete, on: :member #-> url.com/line_items/qty
  end

  get 'navbar_cart'           => 'carts#navbar_cart'
  get 'continue_shopping'     => 'carts#continue_shopping'
  get 'search'                => 'products#product_search'
  get 'checkout'              => 'charges#checkout'


  resources :carts, :orders
  resources :charges
  resources :categories, only: [:show, :index]
  resources :departments, only: [:index]
  resources :products, only: [:show, :index, :new, :create]
  resources :static_pages, only: [:home, :help]


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
