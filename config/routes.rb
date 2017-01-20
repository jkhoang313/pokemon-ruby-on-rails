Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pokedex

  root 'game#index'
  get '/about', to: 'game#about', as: "about"

  post '/trainers/:id', to: 'trainers#claim_token', as: "claim_token"
  get '/trainers/:id/pokemons/:pokemon_id', to: 'pokemons#show', as: "pokemon"
  get '/trainers/:id/pokemons', to: 'pokemons#index', as: "pokemons"
  delete '/trainers/:id/pokemons/:pokemon_id/delete', to: 'pokemons#destroy', as: "delete_pokemon"
  post '/trainers/:id/runaway', to: 'trainers#run_away', as: 'run_away'
  resources :trainers

  post '/wild_encounter/:pokedex_id/pokeball', to: 'wild_pokemon#pokeball', as: 'pokeball'
  post '/wild_encounter/:pokedex_id/great_ball', to: 'wild_pokemon#great_ball', as: 'great_ball'
  post '/wild_encounter/:pokedex_id/ultra_ball', to: 'wild_pokemon#ultra_ball', as: 'ultra_ball'
  get '/wild_encounter', to: 'wild_pokemon#wild', as: 'wild_encounter'
  # change to get requests?

  get '/login', to: 'sessions#new', as: "login"
  post '/login', to: 'sessions#create', as: "new_session"
  delete '/logout', to: 'sessions#destroy', as: "logout"
  get '/logout', to: 'sessions#destroy'

  post '/gyms/:id', to: 'gyms#challenge'
  get '/gyms/:id/results', to: 'gyms#results', as: "gym_results"
  resources :gyms
end
