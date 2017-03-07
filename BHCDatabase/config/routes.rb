Rails.application.routes.draw do
  get 'archives/index'

  get 'attendances/new'

  get 'feedbacks/show'

  get 'service_users_homepage/index'

  get 'meetings/new'

  get 'initiatives/new'

  get 'areas/new'

  get 'sessions/new'

  get 'users/new'

  root 'homepage#index'
  # get  '/help',    to: 'static_pages#help'
  # get  '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/volunteershome', to: 'volunteers_homepage#index'
  get '/serviceusershome', to: 'service_users_homepage#index'
  resources :users do
    member do
      get :archive
      get :unarchive
      patch :update_archive
      patch :update_password
    end
  end
  resources :initiatives do
    member do
      get :archive
      get :unarchive
      patch :update_archive
    end
  end
  resources :areas do
    member do
      get :archive
      get :unarchive
      patch :update_archive
    end
  end
  resources :medical_conditions do
    member do
      get :archive
      get :unarchive
      patch :update_archive
    end
  end
  resources :users,
            :areas,
            :initiatives,
            :meetings,
            :medical_conditions,
            :enrolments,
            :questions,
            :feedbacks,
            :attendances,
            :archives,
            :funders,
            :service_requests
end
