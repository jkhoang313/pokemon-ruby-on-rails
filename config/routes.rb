Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trainers
  resources :pokedex
  # resources :pokemons

  root 'game#index'
  get '/about', to: 'game#about', as: "about"

  post '/trainers/:id', to: 'trainers#reset_token', as: "reset_token"
  get '/trainers/:id/pokemons/:pokemon_id', to: 'pokemons#show', as: "pokemon"
  get '/trainers/:id/pokemons', to: 'pokemons#index', as: "pokemons"
  delete '/trainers/:id/pokemons/delete', to: 'pokemons#destroy', as: "delete_pokemon"

  get '/login', to: 'sessions#new', as: "login"
  post '/login', to: 'sessions#create', as: "new_session"
  delete '/logout', to: 'sessions#destroy', as: "logout"
end
