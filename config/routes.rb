Rails.application.routes.draw do
  root "purchases#index"
  get "/oauth2callback", to: "purchases#update"
  resources :purchases
end
