Rails.application.routes.draw do
  namespace :api do
    resources :articles, only: [:index, :show, :create]
    resources :categories, only: [:show]
  end
end
