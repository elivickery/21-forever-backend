Rails.application.routes.draw do
  resources :users,       only: [:show, :create, :update]
  resources :media_items, only: [:show]

  resources :categories,  only: [:show] do
    resources :goals,     only:[:show, :create, :update, :index]
  end

  get '/categories', to: 'categories#index'
  get '/goals/:goal_id/days', to: 'days#index'
end
