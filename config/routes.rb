Untilthefinalwhistle::Application.routes.draw do
  devise_for :users

  resources :leagues
  resources :teams do
    resources :players
  end

  root :to => 'teams#index'
end