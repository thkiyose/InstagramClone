Rails.application.routes.draw do
  resources :posts, only:[:index,:new]
  resources :users, only:[:new,:create,:show]
  root to: "posts#index"
end
