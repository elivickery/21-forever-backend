Rails.application.routes.draw do
  resources :categories,  only: [:show]
  resources :media_items, only: [:show]
  resources :users,       only: [:show, :create, :update] do 
    resources :goals,     only: [:show, :create, :update, :index] do
      resources :days,    only: [:index]
    end
  end
end
