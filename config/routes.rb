Depot::Application.routes.draw do
  resources :search_suggestions
  
  post 'cart_it' => 'line_items#create'

  namespace :api, defaults: {format: 'json'}  do
    namespace :v1 do
      resources :products
    end
  end
  
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
   
  scope '(:locale)' do
    resources :users
    resources :orders
    resources :line_items
    resources :carts
    resources :products do
    get :who_bought, on: :member
  end
  
  get 'search' => 'store#search'
  root to: 'store#index' , as: 'store'
  end
end