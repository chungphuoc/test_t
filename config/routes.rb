Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks',
                                    confirmations: 'users/confirmations' }

  root 'static_pages#home'

  resource :static_pages, only: [] do
    post :feedback
    get :about_us
    get :contact_us
    get :welcome
    get :term_condition
  end

  resource :invite_friend, only: [] do
    post :send_email
  end

  resources :studios, only: [:new, :create, :show]
  resources :customers, only: [:new, :create, :show]

  resources :courses, only: [:show, :index] do
    member do
      put :rate
      put :like
      put :unlike
      post :book
      post :cancel
    end
  end

  namespace :admin do
    resources :stations do
      member do
        put :approve
        put :reject
      end
    end
    resources :exercises
    resources :customers
    resources :studios do
      resources :contracts, only: [:index, :create, :destroy]
      resources :services, only: [:index, :create, :destroy]
      resources :branches, only: [:index, :create, :destroy]
    end
    resources :courses do
      collection do
        get :change_studio
      end
    end
    resources :teachers
    resources :enrollments do
      collection do
        get :change_course
      end
    end
  end

  namespace :my do
    resource :studio, only: [:show, :edit, :update] do
      collection do
        get :add_teacher
        post :add_payable_option
        get :remove_payable_option
      end
    end
    resource :customer, path: :account, only: [:show, :edit, :update]
  end

  namespace :personal, path: :my do
    resources :courses, only: [:index, :show] do
      collection do
        get :search
        get :past
        get :favourite
        get :featured_courses
        get :event_courses
        get :new_courses
      end
    end
    resources :enrollments, only: [:create, :index, :destroy] do
      collection do
        get :cancel
        get :calories_burnt
        get :confirmation
        get :classes
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
    resources :studios, only: [:index, :show] do
      collection do
        get :by_name
        get :by_station
        get :by_favorite
      end
    end
  end

  namespace :manage do
    resources :studios, only: [:show, :edit, :update]
    resources :contracts, path: :teachers, except: :show
    resources :stations, except: :show do
      put :update, action: :update_listing, on: :collection
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
    resources :payment, only: [:index] do
      collection do
        get :year_filter
        get :month_filter
      end
    end
    resources :enrollments, only: [:index] do
      collection do
        get :booked
        get :passed
        get :change_course
        get :by_join_date
      end
    end
    resources :facilities, only: [:index] do
      put :update, on: :collection
    end
  end
end
