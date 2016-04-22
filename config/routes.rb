Rails.application.routes.draw do

  resources :users, except: [:index]

   resources :artists do
      resources :songs, only: [:new, :show, :create, :update, :destroy]
    end

  resources :session, only: [:new, :create,]
  get '/session/logout' => 'session#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'landings#index'
end
