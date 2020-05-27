Rails.application.routes.draw do
  resources :posts, only:[:index,:new]
  root to: "posts#index"
end
