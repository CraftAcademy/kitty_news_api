Rails.application.routes.draw do
 namespace :api do
   resources :articles, only: [:index, :show, :create]
 end
  
end
