Rails.application.routes.draw do
  devise_for :users
  get 'studio_manage/index'

  root 'static#home'

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
  resources :studios, only: [:new, :create, :show]
  resources :customers, only: [:new, :create, :show]

  namespace :admin do
    resources :stations
    resources :exercises
    resources :customers
    resources :studios
    resources :classes
    resources :teachers
  end

  namespace :my do

  end

  namespace :manage do
    resources :studio , :only => [:show, :edit]
    resources :teachers, :only => [:show, :index, :edit, :create, :destroy]
    resources :class, :only => [:show, :index, :edit, :create, :destroy]
    resources :station_studios, :only => [:show, :create, :destroy]
    resources :exercise_studios, :only => [:show, :create, :destroy]
  end

<<<<<<< HEAD
=======
  get 'login' => "session#new"
  post 'login' => "session#create"
  get 'logout' => "session#destroy"

>>>>>>> add login page, add homepage, add studio manage page, create seed for Studio
end
