Rails.application.routes.draw do
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
  resources :users, :areas, :initiatives, :meetings, :medical_conditions, :enrolments, :questions, :feedbacks, :attendances
end
