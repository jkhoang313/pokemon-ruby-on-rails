Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'game#index'
  get '/about', to: 'game#about', as: "about"
  get '/patch_notes', to: 'game#patch_notes', as: "patch_notes"
  post '/demo_login', to: 'sessions#demo_login', as: "demo_login"


  post '/search', to: 'game#search', as: "search"
  get '/search', to: 'game#get_search'

  get '/training', to: 'game#training', as: "training"
  post '/training', to: 'game#start_training', as: "start_training"
  post '/training/remove', to: 'game#remove_training', as: "remove_training"
  get '/contest', to: 'game#contest', as: "contest"
  post '/contest', to: 'game#start_contest', as: "start_contest"
  post '/contest/remove', to: 'game#remove_contest', as: "remove_contest"
  get '/daycare', to: 'game#daycare', as: "daycare"
  post '/daycare', to: 'game#start_daycare', as: "start_daycare"
  post '/daycare/remove', to: 'game#remove_daycare', as: "remove_daycare"

  post '/trainers/:id/claim', to: 'trainers#claim_token', as: "claim_token"
  post '/trainers/:id/pokemons/:pokemon_id/evolve', to: 'pokemons#evolve', as: "evolve"
  post '/trainers/:id/pokemons/:pokemon_id/evolved', to: 'pokemons#evolved', as: "evolved"
  post '/trainers/:id/pokemons', to: 'pokemons#transfer'
  get '/trainers/:id/pokemons/:pokemon_id', to: 'pokemons#show', as: "pokemon"
  get '/trainers/:id/pokemons', to: 'pokemons#index', as: "pokemons"
  delete '/trainers/:id/pokemons/:pokemon_id/delete', to: 'pokemons#destroy', as: "delete_pokemon"
  post '/trainers/:id/runaway', to: 'trainers#run_away', as: 'run_away'
  get '/signup', to: 'trainers#new', as: "signup"
  post '/trainers/:id', to: 'trainers#change_lead'
  resources :trainers

  get '/pokedex', to: 'pokedex#index', as: "pokedex_index"
  get '/pokedex/:id', to: 'pokedex#show', as: "pokedex"

  post '/wild_encounter/pokeball', to: 'wild_pokemon#pokeball', as: 'pokeball'
  post '/wild_encounter/great_ball', to: 'wild_pokemon#great_ball', as: 'great_ball'
  post '/wild_encounter/ultra_ball', to: 'wild_pokemon#ultra_ball', as: 'ultra_ball'
  post '/wild_encounter/master_ball', to: 'wild_pokemon#master_ball', as: 'master_ball'
  post '/wild_encounter', to: 'wild_pokemon#wild', as: 'wild_encounter'
  get '/wild_encounter', to: 'wild_pokemon#wild'

  get '/login', to: 'sessions#new', as: "login"
  post '/login', to: 'sessions#create', as: "new_session"
  delete '/logout', to: 'sessions#destroy', as: "logout"
  get '/logout', to: 'sessions#destroy'

  post '/gyms/:id', to: 'gyms#challenge'
  get '/gyms/:id/results', to: 'gyms#results', as: "results"
  get '/gyms', to: 'gyms#index', as: "gyms"
  get '/gyms/:id', to: 'gyms#show', as: "gym"
end
