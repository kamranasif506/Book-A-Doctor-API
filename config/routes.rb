Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      get 'current_user', to: 'current_user#index'
      resources :doctors, only: [:index, :show, :create, :destroy]
      resources :specializations, only: [:index]
      resources :appointments, only: [:index, :show, :create, :update, :destroy]
      get 'current_user', to: 'current_user#index'
    end
  end
  
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
