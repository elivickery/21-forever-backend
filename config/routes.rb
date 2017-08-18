Rails.application.routes.draw do
  resources :users,       only: [:show, :create, :update]
  resources :media_items, only: [:show]
  resources :categories,  only: [:index, :show] do
    resources :goals,     only:[:show, :create, :update, :index]
  end
  resources :goals,       only: [:show] do
    resources :days,      only: [:index]
  end
end
