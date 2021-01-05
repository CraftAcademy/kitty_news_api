Rails.application.routes.draw do
 namespace :api do
   resources :articles, only: [:index, :show]
   resources :categories, only: [:index]
 end
  
end
