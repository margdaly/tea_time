Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v0 do
      post 'sessions/create'
      delete 'sessions/destroy'
      resources :customers, only: [:show]
      # get '/customer/:id', to: 'customers#show'
      post '/customer/subscribe', to: 'subscriptions#create'
      patch '/customer/cancel', to: 'subscriptions#update'
    end
  end
end
