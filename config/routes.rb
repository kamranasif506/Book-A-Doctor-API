Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'specializations/index'
      get 'doctors/create'
      get 'doctors/index'
      get 'doctors/show'
      get 'doctors/update'
      get 'doctors/destroy'
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
