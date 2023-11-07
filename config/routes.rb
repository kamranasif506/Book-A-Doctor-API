Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get '/current_user', to: 'current_user#index'

  namespace :api do
    namespace :v1 do
      resources :appointments
	    resources :specializations
      resources :doctors do
        resources :appointments
      end
      get 'specializations/index'
      get 'doctors/create'
      get 'doctors/index'
      get 'doctors/show'
      get 'doctors/update'
      get 'doctors/destroy'
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

  # get current user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

