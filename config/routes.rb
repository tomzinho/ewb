Rails.application.routes.draw do
  devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  get '/companies/:id/dashboard', to: 'companies#dashboard', as: 'dashboard'
  resources :candidates, only: %i[edit update]
  resources :companies, only: %i[show edit update dashboard]
  resources :jobs, only: %i[show new create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
