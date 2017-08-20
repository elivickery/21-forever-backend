Rails.application.routes.draw do

  namespace :api do

    resources :users, param: :access_token,  only: [:show, :create, :update]
    resources :media_items, only: [:show]

    resources :categories,  only: [:show] do
      resources :goals, only:[:show, :create, :update, :index]
    end

    get '/categories',          to: 'categories#index'
    get '/days/count', to: 'days#count'
    put '/days/edit', to: 'days#update'
    post   'login',   to: 'sessions#create'
    delete 'logout',  to: 'sessions#destroy'
    get    'verify',  to: 'sessions#verify_access_token'

    resources :password_resets, only: [:new, :create, :edit, :update]
  end

end
