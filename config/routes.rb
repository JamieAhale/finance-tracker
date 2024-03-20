Rails.application.routes.draw do
  resources :user_stocks, only:[:create]

  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root "welcome#index"

  get "my_portfolio", to: "users#portfolio"

  get "search_stock", to: "stocks#search"

  post '/users/:id/add_ticker', to: 'users#add_ticker', as: 'add_ticker_to_user'

  delete '/users/:id/delete_ticker', to: 'users#delete_ticker', as: 'delete_ticker_from_user'


  post '/users/update_order', to: 'users#update_order'


end
