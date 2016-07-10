Rails.application.routes.draw do
  root to: 'statuses#index'

  resources :reports
  resources :subscribers

  scope :api do
    get 'reports_since', to: 'reports#reports_since', as: 'reports_since'
  end

end
