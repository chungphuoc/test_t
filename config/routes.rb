Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', omniauth_callbacks: "users/omniauth_callbacks"}

  root 'static#home'

  resources :studios, only: [:new, :create, :show]
  resources :customers, only: [:new, :create, :show]

  resources :courses, only: [:show] do
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
  end

  namespace :manage do
    resources :studios , :only => [:show, :edit, :update]
    resources :teachers
    resources :stations
    resources :exercises
    resources :courses do
      collection do
        get :booked
        get :past
      end
    end
  end

end
