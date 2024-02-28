Rails.application.routes.draw do

  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root "welcome#index"

  get "my_portfolio", to: "users#portfolio"

  get "search_stock", to: "stocks#search"
  
end
