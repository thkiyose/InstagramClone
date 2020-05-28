Rails.application.routes.draw do
  resources :posts, only:[:index,:new,:create]
  resources :users, only:[:new,:create,:show]
  resources :sessions, only:[:new,:create,:destroy]
  root to: "posts#index"
end
