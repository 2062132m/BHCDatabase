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
  # make JSON files available on these pages
  get '/user.json', to: 'enrolments#enrol_user'
  get '/initiative.json', to: 'enrolments#enrol_initiative'
  # define routes for controllers
  # custom methods for users
  resources :users do
    member do
      get :archive
      get :unarchive
      patch :update_archive
      patch :update_password
    end
  end
  # custom methods for initiatives
  resources :initiatives do
    member do
      get :archive
      get :unarchive
      patch :update_archive
    end
  end
  # custom methods for areas
  resources :areas do
    member do
      get :archive
      get :unarchive
      patch :update_archive
    end
  end
  # custom methods for medicial conditions
  resources :medical_conditions do
    member do
      get :archive
      get :unarchive
      patch :update_archive
    end
  end
  # customs methods for enrolments
  resources :enrolments do
    member do
      get :enrol_initiative
      get :enrol_user
    end
  end
  # listing resources in this style defines default routes: new, show, index, etc...
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
