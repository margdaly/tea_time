Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v0 do
      resources :customers, only: %i[show] do
        post '/subscribe', to: 'subscriptions#create'
        patch '/cancel', to: 'subscriptions#update'
      end
    end
  end
end
