Blog::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, :controllers => { :registrations => "registrations" }

  namespace :admin do
    resources :backgrounds
    resources :users
    resources :posts, except: :show
    resources :hubs,  except: :show, :path => "categories"
    get '/' => 'manage#index'
  end

  root 'home#index'

  resources :posts, only: [:index, :show] do
    collection do
      get 'search' => 'posts#search'
      get 'articles' => 'posts#articles'
      get 'travels' => 'posts#travels'
    end
  end

  resources :hubs, only: [:index, :show], :path => "categories"
  match '/autocomplete', to: 'posts#autocomplete', via: [:get, :post]

  get '/home/map' => 'home#map'
  get '/home/archive'  => 'home#archive'

  get 'tags/:tag', to: 'posts#index', as: :tag

end
