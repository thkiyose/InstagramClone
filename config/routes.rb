Rails.application.routes.draw do
  resources :posts, only:[:index,:new,:create]
  resources :users, only:[:new,:create,:show,:update] do
    member do
      post "image_update"
    end
  end
  resources :sessions, only:[:new,:create,:destroy]
  root to: "posts#index"
end
