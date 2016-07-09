Rails.application.routes.draw do
  root to: 'statuses#index'

  resources :reports
end
