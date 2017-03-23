Rails.application.routes.draw do
  root 'homepage#index'
  get '/contact', to: 'static_pages#contact'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/volunteershome', to: 'volunteers_homepage#index'
  get '/serviceusershome', to: 'service_users_homepage#index'

  # Make JSON files available on these pages
  get '/user.json', to: 'enrolments#enrol_user'
  get '/initiative.json', to: 'enrolments#enrol_initiative'
  get '/medical_condition.json', to: 'conditions#new'

  # Custom methods for users
  resources :users do
    member do
      get :new_volunteer
      post :create_volunteer
      get :archive
      get :unarchive
      patch :update_archive
      get :update_password
      patch :change_password
    end
  end

  # Custom methods for initiatives
  resources :initiatives do
    member do
      get :archive
      get :unarchive
      patch :update_archive
    end
  end

  # Custom method for areas
  resources :areas do
    member do
      get :archive
      get :unarchive
      patch :update_archive
    end
  end

  # Custom method for medicial conditions
  resources :medical_conditions do
    member do
      get :archive
      get :unarchive
      patch :update_archive
    end
  end

  # Custom methods for enrolments
  resources :enrolments, only: [:create, :destroy] do
    member do
      get :enrol_initiative
      get :enrol_user
    end
  end

  # Custom methods for funders
  resources :funders do
    member do
      get :fund_initiative
      get :fund_medical_condition
      get :fund_user
      post :new_fund_initiative
      post :new_fund_medical_condition
      post :new_fund_user
      get :remove_user_funding
      get :remove_initiative_funding
      get :remove_medical_funding
    end
  end

  # Other links that are limited to only the CRUD operations required
  resources :conditions, only: [:new, :create, :destroy]
  resources :archives, only: [:index]
  resources :attendances, only: [:create]
  resources :feedbacks, only: [:show, :new, :create]
  resources :meetings, only: [:index, :show, :new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions, only: [:index, :show, :edit, :update]
  resources :service_requests, only: [:show, :new, :create, :destroy]
end
