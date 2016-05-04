Rails.application.routes.draw do
  root 'static#home'
  devise_for :users

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
    resources :accounts, only: [:show, :edit, :update]
    resources :courses, only: [:index] do
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
    resources :courses do
      collection do
        get :booked
        get :past
      end
    end
  end

end
