Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trainers
  resources :pokedex

  root 'game#index'
  get '/about', to: 'game#about', as: "about"

  post '/trainers/:id', to: 'trainers#claim_token', as: "claim_token"
  get '/trainers/:id/pokemons/:pokemon_id', to: 'pokemons#show', as: "pokemon"
  get '/trainers/:id/pokemons', to: 'pokemons#index', as: "pokemons"
  delete '/trainers/:id/pokemons/:pokemon_id/delete', to: 'pokemons#destroy', as: "delete_pokemon"

  post '/wild_encounter', to: 'pokemons#wild', as: 'wild_encounter'
  post '/wild_encounter/:pokedex_id', to: 'pokemons#pokeball', as: 'capture_pokemon'

  get '/login', to: 'sessions#new', as: "login"
  post '/login', to: 'sessions#create', as: "new_session"
  delete '/logout', to: 'sessions#destroy', as: "logout"
end
