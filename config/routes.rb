Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'static_pages#home'

  resource :static_pages, only: [] do
    post :feedback
  end

  resources :studios, only: [:new, :create, :show]
  resources :customers, only: [:new, :create, :show]

  resources :courses, only: [:show, :index] do
    get :search, on: :collection
    member do
      put :rate
      put :like
      put :unlike
      post :book
      post :cancel
    end
  end

  namespace :admin do
    resources :stations
    resources :exercises
    resources :customers
    resources :studios
    resources :courses
    resources :teachers
  end

  namespace :my do
    resource :studio, only: [:show, :edit, :update]
    resource :customer, only: [:show, :edit, :update]
  end

  namespace :personal do
    resources :courses, only: [:index, :show] do
      collection do
        get :past
        get :favourite
      end
    end
    resources :enrollments, only: [:create, :index, :destroy] do
      collection do
        get :cancel
      end
    end
    resources :favourite_courses, only: [:index] do
      collection do
        post :remove
        post :add
      end
    end
    resources :checkouts, only: [] do
      collection do
        post :process_payment
      end
    end
  end

  namespace :manage do
    resources :studios, only: [:show, :edit, :update]
    resources :contracts, path: :teachers, only: [:new, :index, :create, :destroy]
    resources :stations, only: :index do
      put :update, on: :collection
    end
    resources :exercises, only: :index do
      put :update, on: :collection
    end
    resources :courses do
      collection do
        get :booked
        get :past
      end
      member do
        put :close
        put :reopen
      end
    end
  end
end
