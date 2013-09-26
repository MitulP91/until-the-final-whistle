Untilthefinalwhistle::Application.routes.draw do
  devise_for :users

  resources :leagues
  resources :teams do
    resources :players, :except => [:index]
  end

  get '/favorites', :to => 'teams#favorites', :as => 'favorites'
  post '/favorites/:team_id/create', :to => 'teams#favorites_create', :as => 'new_favorites'

  root :to => 'teams#index'
end