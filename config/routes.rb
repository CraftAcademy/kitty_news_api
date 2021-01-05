Rails.application.routes.draw do
  namespace :api do
    get 'categories/show'
  end
  get 'api/categories'
 namespace :api do
   resources :articles, only: [:index, :show]
   resources :categories, only: [:show]
 end
  
end
