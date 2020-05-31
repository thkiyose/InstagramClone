Rails.application.routes.draw do
  resources :posts, only:[:index,:new,:create,:show,:edit,:update,:destroy] do
    collection do
      post :confirm
    end
  end
  resources :users, only:[:new,:create,:show,:edit,:update] do
    member do
      post :image_update
    end
  end
  resources :sessions, only:[:new,:create,:destroy]
  resources :favorites, only:[:create,:destroy,:index]
  root to: "posts#index"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
