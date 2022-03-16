Rails.application.routes.draw do
  # get 'appointments/index'
  # get 'appointments/show'
  # get 'appointments/create'
  # get 'appointments/destroy'
  resources :appointments, only: [:index, :show, :create, :destroy]
  get 'doctors', to: 'doctors#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "hello#index"
end
