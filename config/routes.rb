Rails.application.routes.draw do
  root to: 'statuses#index'

  resources :reports
  resources :subscribers
end
