Rails.application.routes.draw do
  devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  get '/role/:id', to: 'pages#role', as: 'role'
  patch '/role/:id', to: 'pages#role_update'
  get '/candidates/:id/dashboard', to: 'candidates#dashboard', as: 'candidate_dashboard'
  get '/companies/:id/dashboard', to: 'companies#dashboard', as: 'company_dashboard'

  resources :candidates, only: %i[edit update dashboard index]
  resources :companies, only: %i[show edit update dashboard]
  resources :resumes
  resources :jobs, only: %i[show new create index]

  resources :jobs do
    resources :applies, only: %i[new]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
