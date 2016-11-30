Rails.application.routes.draw do
  get 'users/new'

  get 'welcome/home'

  root 'welcome#home'
end
