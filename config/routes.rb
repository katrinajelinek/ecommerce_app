Rails.application.routes.draw do
  namespace :api do
    get "/purchases" => "purchases#index"
    get "/purchases/:id" => "purchases#show"
    post "/purchases" => "purchases#create"

    get "/carted_products" => "carted_products#index"
    post "/carted_products" => "carted_products#create"
    delete "/carted_products/:id" => "carted_products#destroy"

    resources :users, :products

    post "/sessions" => "sessions#create"
  end
end
