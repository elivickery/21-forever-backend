Rails.application.routes.draw do

  namespace :api do

    resources :users,       only: [:show, :create, :update]
    resources :media_items, only: [:show]

    resources :goals,     only:[:create, :update]

    get '/categories', to: 'categories#index'
    get '/days/count', to: 'days#count'
    put '/days/edit',   to: 'days#update'
    get '/goals/achieved', to: 'goals#achieved'
    get '/goals/current', to: 'goals#current'
    get 'media/health', to: 'media#health'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    get    '/verify',  to: 'sessions#verify_access_token'

    resources :password_resets, only: [:new, :create, :edit, :update]
  end

end
