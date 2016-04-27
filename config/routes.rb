Rails.application.routes.draw do


  resources :users, except: [:index]

  resources :artists do
    resources :songs
  end
  resources :mobile
  resources :favorites

  resources :session, except: [:destroy]
  resources :comments
  # resources :session, only: [:new, :create,]
  delete '/session/logout' => 'session#destroy'
  get '/songs/drop_song' => 'songs#drop_song'

  resources :requests
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'landings#index'
end
