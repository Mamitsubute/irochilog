Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'users#index'
  resources :pokemons, :except => [:new, :edit, :create]
end
