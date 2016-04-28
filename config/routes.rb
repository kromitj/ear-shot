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
  post '/songs/available' => 'songs#available_songs'

  resources :requests
  get '/nearby/requests' => 'requests#near'
  get '/near/requests/:params' => 'requests#near_songs'
  get '/songs/heat_map/:id' => 'songs#heat_map'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'landings#index'
end
