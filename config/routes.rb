Untilthefinalwhistle::Application.routes.draw do
  devise_for :users

  resources :leagues
  resources :teams do
    resources :players, :except => [:index]
  end

  root :to => 'teams#index'
end