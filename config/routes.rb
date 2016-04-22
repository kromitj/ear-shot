Rails.application.routes.draw do

  resources :users, only: [:new, :show, :create] do
    resources :artists, only: [:show, :new, :create]
  end

  resources :session, only: [:new, :create,]
  get '/session/logout' => 'session#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'landings#index'
end
