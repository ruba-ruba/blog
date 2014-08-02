Blog::Application.routes.draw do
  
  devise_for :users, :controllers => { :registrations => "registrations" }
  namespace :admin do
    resources :backgrounds
    resources :users
    get '/' => 'manage#index'
  end

  get "home/index"
  mount Ckeditor::Engine => '/ckeditor'
  
  root 'home#index'

  # blog
  resources :hubs, :path => "categories"
  resources :posts do
    collection do
      get 'search' => 'posts#search'
      get 'articles' => 'posts#articles'
      get 'travels' => 'posts#travels'
    end
  end
  match '/autocomplete', to: 'posts#autocomplete', via: [:get, :post]

  # info controller
  get '/home/map' => 'home#map'
  get '/home/archive'  => 'home#archive'

  # acts as taggable on gem
  get 'tags/:tag', to: 'posts#index', as: :tag


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
