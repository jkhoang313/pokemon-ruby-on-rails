Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'game#index'
  get '/about', to: 'game#about', as: "about"
  post '/search', to: 'game#search', as: "search"

  post '/trainers/:id/claim', to: 'trainers#claim_token', as: "claim_token"
  post '/trainers/:id/pokemons', to: 'pokemons#transfer'
  get '/trainers/:id/pokemons/:pokemon_id', to: 'pokemons#show', as: "pokemon"
  get '/trainers/:id/pokemons', to: 'pokemons#index', as: "pokemons"
  delete '/trainers/:id/pokemons/:pokemon_id/delete', to: 'pokemons#destroy', as: "delete_pokemon"
  post '/trainers/:id/runaway', to: 'trainers#run_away', as: 'run_away'
  get '/signup', to: 'trainers#new', as: "signup"
  post '/trainers/:id', to: 'trainers#change_lead'
  resources :trainers

  resources :pokedex

  post '/wild_encounter/:pokemon_name/pokeball', to: 'wild_pokemon#pokeball', as: 'pokeball'
  post '/wild_encounter/:pokemon_name/great_ball', to: 'wild_pokemon#great_ball', as: 'great_ball'
  post '/wild_encounter/:pokemon_name/ultra_ball', to: 'wild_pokemon#ultra_ball', as: 'ultra_ball'
  post '/wild_encounter', to: 'wild_pokemon#wild', as: 'wild_encounter'

  get '/login', to: 'sessions#new', as: "login"
  post '/login', to: 'sessions#create', as: "new_session"
  delete '/logout', to: 'sessions#destroy', as: "logout"
  get '/logout', to: 'sessions#destroy'

  post '/gyms/:id', to: 'gyms#challenge'
  get '/gyms/:id/results', to: 'gyms#results', as: "results"
  resources :gyms
end
