# # loads pokedex
# puts "Loading Pokedex..."
# id = 1
# while id <= 151
#   @pokedex = JSON.parse(RestClient.get("https://pokeapi.co/api/v2/pokemon/#{id}/"))
#
#   pokedex_params = {"name"=> @pokedex["name"].capitalize}
#   @pokedex["stats"].each do |stat_hash|
#     stat_name = stat_hash["stat"]["name"].gsub("-", "_")
#     stat_value = stat_hash["base_stat"]
#     pokedex_params[stat_name] = stat_value
#   end
#   Pokedex.create(pokedex_params)
#
#   puts "So many Pokemon to load..." if id == 75
#   id += 1
# end
#
@pokemon_api = [{"name"=>"Bulbasaur", "speed"=>45, "special_defense"=>65, "special_attack"=>65, "defense"=>49, "attack"=>49, "hp"=>45}, {"name"=>"Ivysaur", "speed"=>60, "special_defense"=>80, "special_attack"=>80, "defense"=>63, "attack"=>62, "hp"=>60}, {"name"=>"Venusaur", "speed"=>80, "special_defense"=>100, "special_attack"=>100, "defense"=>83, "attack"=>82, "hp"=>80}, {"name"=>"Charmander", "speed"=>65, "special_defense"=>50, "special_attack"=>60, "defense"=>43, "attack"=>52, "hp"=>39}, {"name"=>"Charmeleon", "speed"=>80, "special_defense"=>65, "special_attack"=>80, "defense"=>58, "attack"=>64, "hp"=>58}, {"name"=>"Charizard", "speed"=>100, "special_defense"=>85, "special_attack"=>109, "defense"=>78, "attack"=>84, "hp"=>78}, {"name"=>"Squirtle", "speed"=>43, "special_defense"=>64, "special_attack"=>50, "defense"=>65, "attack"=>48, "hp"=>44}, {"name"=>"Wartortle", "speed"=>58, "special_defense"=>80, "special_attack"=>65, "defense"=>80, "attack"=>63, "hp"=>59}, {"name"=>"Blastoise", "speed"=>78, "special_defense"=>105, "special_attack"=>85, "defense"=>100, "attack"=>83, "hp"=>79}, {"name"=>"Caterpie", "speed"=>45, "special_defense"=>20, "special_attack"=>20, "defense"=>35, "attack"=>30, "hp"=>45}, {"name"=>"Metapod", "speed"=>30, "special_defense"=>25, "special_attack"=>25, "defense"=>55, "attack"=>20, "hp"=>50}, {"name"=>"Butterfree", "speed"=>70, "special_defense"=>80, "special_attack"=>90, "defense"=>50, "attack"=>45, "hp"=>60}, {"name"=>"Weedle", "speed"=>50, "special_defense"=>20, "special_attack"=>20, "defense"=>30, "attack"=>35, "hp"=>40}, {"name"=>"Kakuna", "speed"=>35, "special_defense"=>25, "special_attack"=>25, "defense"=>50, "attack"=>25, "hp"=>45}, {"name"=>"Beedrill", "speed"=>75, "special_defense"=>80, "special_attack"=>45, "defense"=>40, "attack"=>90, "hp"=>65}, {"name"=>"Pidgey", "speed"=>56, "special_defense"=>35, "special_attack"=>35, "defense"=>40, "attack"=>45, "hp"=>40}, {"name"=>"Pidgeotto", "speed"=>71, "special_defense"=>50, "special_attack"=>50, "defense"=>55, "attack"=>60, "hp"=>63}, {"name"=>"Pidgeot", "speed"=>101, "special_defense"=>70, "special_attack"=>70, "defense"=>75, "attack"=>80, "hp"=>83}, {"name"=>"Rattata", "speed"=>72, "special_defense"=>35, "special_attack"=>25, "defense"=>35, "attack"=>56, "hp"=>30}, {"name"=>"Raticate", "speed"=>97, "special_defense"=>70, "special_attack"=>50, "defense"=>60, "attack"=>81, "hp"=>55}, {"name"=>"Spearow", "speed"=>70, "special_defense"=>31, "special_attack"=>31, "defense"=>30, "attack"=>60, "hp"=>40}, {"name"=>"Fearow", "speed"=>100, "special_defense"=>61, "special_attack"=>61, "defense"=>65, "attack"=>90, "hp"=>65}, {"name"=>"Ekans", "speed"=>55, "special_defense"=>54, "special_attack"=>40, "defense"=>44, "attack"=>60, "hp"=>35}, {"name"=>"Arbok", "speed"=>80, "special_defense"=>79, "special_attack"=>65, "defense"=>69, "attack"=>85, "hp"=>60}, {"name"=>"Pikachu", "speed"=>90, "special_defense"=>50, "special_attack"=>50, "defense"=>40, "attack"=>55, "hp"=>35}, {"name"=>"Raichu", "speed"=>110, "special_defense"=>80, "special_attack"=>90, "defense"=>55, "attack"=>90, "hp"=>60}, {"name"=>"Sandshrew", "speed"=>40, "special_defense"=>30, "special_attack"=>20, "defense"=>85, "attack"=>75, "hp"=>50}, {"name"=>"Sandslash", "speed"=>65, "special_defense"=>55, "special_attack"=>45, "defense"=>110, "attack"=>100, "hp"=>75}, {"name"=>"Nidoran-f", "speed"=>41, "special_defense"=>40, "special_attack"=>40, "defense"=>52, "attack"=>47, "hp"=>55}, {"name"=>"Nidorina", "speed"=>56, "special_defense"=>55, "special_attack"=>55, "defense"=>67, "attack"=>62, "hp"=>70}, {"name"=>"Nidoqueen", "speed"=>76, "special_defense"=>85, "special_attack"=>75, "defense"=>87, "attack"=>92, "hp"=>90}, {"name"=>"Nidoran-m", "speed"=>50, "special_defense"=>40, "special_attack"=>40, "defense"=>40, "attack"=>57, "hp"=>46}, {"name"=>"Nidorino", "speed"=>65, "special_defense"=>55, "special_attack"=>55, "defense"=>57, "attack"=>72, "hp"=>61}, {"name"=>"Nidoking", "speed"=>85, "special_defense"=>75, "special_attack"=>85, "defense"=>77, "attack"=>102, "hp"=>81}, {"name"=>"Clefairy", "speed"=>35, "special_defense"=>65, "special_attack"=>60, "defense"=>48, "attack"=>45, "hp"=>70}, {"name"=>"Clefable", "speed"=>60, "special_defense"=>90, "special_attack"=>95, "defense"=>73, "attack"=>70, "hp"=>95}, {"name"=>"Vulpix", "speed"=>65, "special_defense"=>65, "special_attack"=>50, "defense"=>40, "attack"=>41, "hp"=>38}, {"name"=>"Ninetales", "speed"=>100, "special_defense"=>100, "special_attack"=>81, "defense"=>75, "attack"=>76, "hp"=>73}, {"name"=>"Jigglypuff", "speed"=>20, "special_defense"=>25, "special_attack"=>45, "defense"=>20, "attack"=>45, "hp"=>115}, {"name"=>"Wigglytuff", "speed"=>45, "special_defense"=>50, "special_attack"=>85, "defense"=>45, "attack"=>70, "hp"=>140}, {"name"=>"Zubat", "speed"=>55, "special_defense"=>40, "special_attack"=>30, "defense"=>35, "attack"=>45, "hp"=>40}, {"name"=>"Golbat", "speed"=>90, "special_defense"=>75, "special_attack"=>65, "defense"=>70, "attack"=>80, "hp"=>75}, {"name"=>"Oddish", "speed"=>30, "special_defense"=>65, "special_attack"=>75, "defense"=>55, "attack"=>50, "hp"=>45}, {"name"=>"Gloom", "speed"=>40, "special_defense"=>75, "special_attack"=>85, "defense"=>70, "attack"=>65, "hp"=>60}, {"name"=>"Vileplume", "speed"=>50, "special_defense"=>90, "special_attack"=>110, "defense"=>85, "attack"=>80, "hp"=>75}, {"name"=>"Paras", "speed"=>25, "special_defense"=>55, "special_attack"=>45, "defense"=>55, "attack"=>70, "hp"=>35}, {"name"=>"Parasect", "speed"=>30, "special_defense"=>80, "special_attack"=>60, "defense"=>80, "attack"=>95, "hp"=>60}, {"name"=>"Venonat", "speed"=>45, "special_defense"=>55, "special_attack"=>40, "defense"=>50, "attack"=>55, "hp"=>60}, {"name"=>"Venomoth", "speed"=>90, "special_defense"=>75, "special_attack"=>90, "defense"=>60, "attack"=>65, "hp"=>70}, {"name"=>"Diglett", "speed"=>95, "special_defense"=>45, "special_attack"=>35, "defense"=>25, "attack"=>55, "hp"=>10}, {"name"=>"Dugtrio", "speed"=>120, "special_defense"=>70, "special_attack"=>50, "defense"=>50, "attack"=>80, "hp"=>35}, {"name"=>"Meowth", "speed"=>90, "special_defense"=>40, "special_attack"=>40, "defense"=>35, "attack"=>45, "hp"=>40}, {"name"=>"Persian", "speed"=>115, "special_defense"=>65, "special_attack"=>65, "defense"=>60, "attack"=>70, "hp"=>65}, {"name"=>"Psyduck", "speed"=>55, "special_defense"=>50, "special_attack"=>65, "defense"=>48, "attack"=>52, "hp"=>50}, {"name"=>"Golduck", "speed"=>85, "special_defense"=>80, "special_attack"=>95, "defense"=>78, "attack"=>82, "hp"=>80}, {"name"=>"Mankey", "speed"=>70, "special_defense"=>45, "special_attack"=>35, "defense"=>35, "attack"=>80, "hp"=>40}, {"name"=>"Primeape", "speed"=>95, "special_defense"=>70, "special_attack"=>60, "defense"=>60, "attack"=>105, "hp"=>65}, {"name"=>"Growlithe", "speed"=>60, "special_defense"=>50, "special_attack"=>70, "defense"=>45, "attack"=>70, "hp"=>55}, {"name"=>"Arcanine", "speed"=>95, "special_defense"=>80, "special_attack"=>100, "defense"=>80, "attack"=>110, "hp"=>90}, {"name"=>"Poliwag", "speed"=>90, "special_defense"=>40, "special_attack"=>40, "defense"=>40, "attack"=>50, "hp"=>40}, {"name"=>"Poliwhirl", "speed"=>90, "special_defense"=>50, "special_attack"=>50, "defense"=>65, "attack"=>65, "hp"=>65}, {"name"=>"Poliwrath", "speed"=>70, "special_defense"=>90, "special_attack"=>70, "defense"=>95, "attack"=>95, "hp"=>90}, {"name"=>"Abra", "speed"=>90, "special_defense"=>55, "special_attack"=>105, "defense"=>15, "attack"=>20, "hp"=>25}, {"name"=>"Kadabra", "speed"=>105, "special_defense"=>70, "special_attack"=>120, "defense"=>30, "attack"=>35, "hp"=>40}, {"name"=>"Alakazam", "speed"=>120, "special_defense"=>95, "special_attack"=>135, "defense"=>45, "attack"=>50, "hp"=>55}, {"name"=>"Machop", "speed"=>35, "special_defense"=>35, "special_attack"=>35, "defense"=>50, "attack"=>80, "hp"=>70}, {"name"=>"Machoke", "speed"=>45, "special_defense"=>60, "special_attack"=>50, "defense"=>70, "attack"=>100, "hp"=>80}, {"name"=>"Machamp", "speed"=>55, "special_defense"=>85, "special_attack"=>65, "defense"=>80, "attack"=>130, "hp"=>90}, {"name"=>"Bellsprout", "speed"=>40, "special_defense"=>30, "special_attack"=>70, "defense"=>35, "attack"=>75, "hp"=>50}, {"name"=>"Weepinbell", "speed"=>55, "special_defense"=>45, "special_attack"=>85, "defense"=>50, "attack"=>90, "hp"=>65}, {"name"=>"Victreebel", "speed"=>70, "special_defense"=>70, "special_attack"=>100, "defense"=>65, "attack"=>105, "hp"=>80}, {"name"=>"Tentacool", "speed"=>70, "special_defense"=>100, "special_attack"=>50, "defense"=>35, "attack"=>40, "hp"=>40}, {"name"=>"Tentacruel", "speed"=>100, "special_defense"=>120, "special_attack"=>80, "defense"=>65, "attack"=>70, "hp"=>80}, {"name"=>"Geodude", "speed"=>20, "special_defense"=>30, "special_attack"=>30, "defense"=>100, "attack"=>80, "hp"=>40}, {"name"=>"Graveler", "speed"=>35, "special_defense"=>45, "special_attack"=>45, "defense"=>115, "attack"=>95, "hp"=>55}, {"name"=>"Golem", "speed"=>45, "special_defense"=>65, "special_attack"=>55, "defense"=>130, "attack"=>120, "hp"=>80}, {"name"=>"Ponyta", "speed"=>90, "special_defense"=>65, "special_attack"=>65, "defense"=>55, "attack"=>85, "hp"=>50}, {"name"=>"Rapidash", "speed"=>105, "special_defense"=>80, "special_attack"=>80, "defense"=>70, "attack"=>100, "hp"=>65}, {"name"=>"Slowpoke", "speed"=>15, "special_defense"=>40, "special_attack"=>40, "defense"=>65, "attack"=>65, "hp"=>90}, {"name"=>"Slowbro", "speed"=>30, "special_defense"=>80, "special_attack"=>100, "defense"=>110, "attack"=>75, "hp"=>95}, {"name"=>"Magnemite", "speed"=>45, "special_defense"=>55, "special_attack"=>95, "defense"=>70, "attack"=>35, "hp"=>25}, {"name"=>"Magneton", "speed"=>70, "special_defense"=>70, "special_attack"=>120, "defense"=>95, "attack"=>60, "hp"=>50}, {"name"=>"Farfetchd", "speed"=>60, "special_defense"=>62, "special_attack"=>58, "defense"=>55, "attack"=>65, "hp"=>52}, {"name"=>"Doduo", "speed"=>75, "special_defense"=>35, "special_attack"=>35, "defense"=>45, "attack"=>85, "hp"=>35}, {"name"=>"Dodrio", "speed"=>100, "special_defense"=>60, "special_attack"=>60, "defense"=>70, "attack"=>110, "hp"=>60}, {"name"=>"Seel", "speed"=>45, "special_defense"=>70, "special_attack"=>45, "defense"=>55, "attack"=>45, "hp"=>65}, {"name"=>"Dewgong", "speed"=>70, "special_defense"=>95, "special_attack"=>70, "defense"=>80, "attack"=>70, "hp"=>90}, {"name"=>"Grimer", "speed"=>25, "special_defense"=>50, "special_attack"=>40, "defense"=>50, "attack"=>80, "hp"=>80}, {"name"=>"Muk", "speed"=>50, "special_defense"=>100, "special_attack"=>65, "defense"=>75, "attack"=>105, "hp"=>105}, {"name"=>"Shellder", "speed"=>40, "special_defense"=>25, "special_attack"=>45, "defense"=>100, "attack"=>65, "hp"=>30}, {"name"=>"Cloyster", "speed"=>70, "special_defense"=>45, "special_attack"=>85, "defense"=>180, "attack"=>95, "hp"=>50}, {"name"=>"Gastly", "speed"=>80, "special_defense"=>35, "special_attack"=>100, "defense"=>30, "attack"=>35, "hp"=>30}, {"name"=>"Haunter", "speed"=>95, "special_defense"=>55, "special_attack"=>115, "defense"=>45, "attack"=>50, "hp"=>45}, {"name"=>"Gengar", "speed"=>110, "special_defense"=>75, "special_attack"=>130, "defense"=>60, "attack"=>65, "hp"=>60}, {"name"=>"Onix", "speed"=>70, "special_defense"=>45, "special_attack"=>30, "defense"=>160, "attack"=>45, "hp"=>35}, {"name"=>"Drowzee", "speed"=>42, "special_defense"=>90, "special_attack"=>43, "defense"=>45, "attack"=>48, "hp"=>60}, {"name"=>"Hypno", "speed"=>67, "special_defense"=>115, "special_attack"=>73, "defense"=>70, "attack"=>73, "hp"=>85}, {"name"=>"Krabby", "speed"=>50, "special_defense"=>25, "special_attack"=>25, "defense"=>90, "attack"=>105, "hp"=>30}, {"name"=>"Kingler", "speed"=>75, "special_defense"=>50, "special_attack"=>50, "defense"=>115, "attack"=>130, "hp"=>55}, {"name"=>"Voltorb", "speed"=>100, "special_defense"=>55, "special_attack"=>55, "defense"=>50, "attack"=>30, "hp"=>40}, {"name"=>"Electrode", "speed"=>140, "special_defense"=>80, "special_attack"=>80, "defense"=>70, "attack"=>50, "hp"=>60}, {"name"=>"Exeggcute", "speed"=>40, "special_defense"=>45, "special_attack"=>60, "defense"=>80, "attack"=>40, "hp"=>60}, {"name"=>"Exeggutor", "speed"=>55, "special_defense"=>65, "special_attack"=>125, "defense"=>85, "attack"=>95, "hp"=>95}, {"name"=>"Cubone", "speed"=>35, "special_defense"=>50, "special_attack"=>40, "defense"=>95, "attack"=>50, "hp"=>50}, {"name"=>"Marowak", "speed"=>45, "special_defense"=>80, "special_attack"=>50, "defense"=>110, "attack"=>80, "hp"=>60}, {"name"=>"Hitmonlee", "speed"=>87, "special_defense"=>110, "special_attack"=>35, "defense"=>53, "attack"=>120, "hp"=>50}, {"name"=>"Hitmonchan", "speed"=>76, "special_defense"=>110, "special_attack"=>35, "defense"=>79, "attack"=>105, "hp"=>50}, {"name"=>"Lickitung", "speed"=>30, "special_defense"=>75, "special_attack"=>60, "defense"=>75, "attack"=>55, "hp"=>90}, {"name"=>"Koffing", "speed"=>35, "special_defense"=>45, "special_attack"=>60, "defense"=>95, "attack"=>65, "hp"=>40}, {"name"=>"Weezing", "speed"=>60, "special_defense"=>70, "special_attack"=>85, "defense"=>120, "attack"=>90, "hp"=>65}, {"name"=>"Rhyhorn", "speed"=>25, "special_defense"=>30, "special_attack"=>30, "defense"=>95, "attack"=>85, "hp"=>80}, {"name"=>"Rhydon", "speed"=>40, "special_defense"=>45, "special_attack"=>45, "defense"=>120, "attack"=>130, "hp"=>105}, {"name"=>"Chansey", "speed"=>50, "special_defense"=>105, "special_attack"=>35, "defense"=>5, "attack"=>5, "hp"=>250}, {"name"=>"Tangela", "speed"=>60, "special_defense"=>40, "special_attack"=>100, "defense"=>115, "attack"=>55, "hp"=>65}, {"name"=>"Kangaskhan", "speed"=>90, "special_defense"=>80, "special_attack"=>40, "defense"=>80, "attack"=>95, "hp"=>105}, {"name"=>"Horsea", "speed"=>60, "special_defense"=>25, "special_attack"=>70, "defense"=>70, "attack"=>40, "hp"=>30}, {"name"=>"Seadra", "speed"=>85, "special_defense"=>45, "special_attack"=>95, "defense"=>95, "attack"=>65, "hp"=>55}, {"name"=>"Goldeen", "speed"=>63, "special_defense"=>50, "special_attack"=>35, "defense"=>60, "attack"=>67, "hp"=>45}, {"name"=>"Seaking", "speed"=>68, "special_defense"=>80, "special_attack"=>65, "defense"=>65, "attack"=>92, "hp"=>80}, {"name"=>"Staryu", "speed"=>85, "special_defense"=>55, "special_attack"=>70, "defense"=>55, "attack"=>45, "hp"=>30}, {"name"=>"Starmie", "speed"=>115, "special_defense"=>85, "special_attack"=>100, "defense"=>85, "attack"=>75, "hp"=>60}, {"name"=>"Mr-mime", "speed"=>90, "special_defense"=>120, "special_attack"=>100, "defense"=>65, "attack"=>45, "hp"=>40}, {"name"=>"Scyther", "speed"=>105, "special_defense"=>80, "special_attack"=>55, "defense"=>80, "attack"=>110, "hp"=>70}, {"name"=>"Jynx", "speed"=>95, "special_defense"=>95, "special_attack"=>115, "defense"=>35, "attack"=>50, "hp"=>65}, {"name"=>"Electabuzz", "speed"=>105, "special_defense"=>85, "special_attack"=>95, "defense"=>57, "attack"=>83, "hp"=>65}, {"name"=>"Magmar", "speed"=>93, "special_defense"=>85, "special_attack"=>100, "defense"=>57, "attack"=>95, "hp"=>65}, {"name"=>"Pinsir", "speed"=>85, "special_defense"=>70, "special_attack"=>55, "defense"=>100, "attack"=>125, "hp"=>65}, {"name"=>"Tauros", "speed"=>110, "special_defense"=>70, "special_attack"=>40, "defense"=>95, "attack"=>100, "hp"=>75}, {"name"=>"Magikarp", "speed"=>80, "special_defense"=>20, "special_attack"=>15, "defense"=>55, "attack"=>10, "hp"=>20}, {"name"=>"Gyarados", "speed"=>81, "special_defense"=>100, "special_attack"=>60, "defense"=>79, "attack"=>125, "hp"=>95}, {"name"=>"Lapras", "speed"=>60, "special_defense"=>95, "special_attack"=>85, "defense"=>80, "attack"=>85, "hp"=>130}, {"name"=>"Ditto", "speed"=>48, "special_defense"=>48, "special_attack"=>48, "defense"=>48, "attack"=>48, "hp"=>48}, {"name"=>"Eevee", "speed"=>55, "special_defense"=>65, "special_attack"=>45, "defense"=>50, "attack"=>55, "hp"=>55}, {"name"=>"Vaporeon", "speed"=>65, "special_defense"=>95, "special_attack"=>110, "defense"=>60, "attack"=>65, "hp"=>130}, {"name"=>"Jolteon", "speed"=>130, "special_defense"=>95, "special_attack"=>110, "defense"=>60, "attack"=>65, "hp"=>65}, {"name"=>"Flareon", "speed"=>65, "special_defense"=>110, "special_attack"=>95, "defense"=>60, "attack"=>130, "hp"=>65}, {"name"=>"Porygon", "speed"=>40, "special_defense"=>75, "special_attack"=>85, "defense"=>70, "attack"=>60, "hp"=>65}, {"name"=>"Omanyte", "speed"=>35, "special_defense"=>55, "special_attack"=>90, "defense"=>100, "attack"=>40, "hp"=>35}, {"name"=>"Omastar", "speed"=>55, "special_defense"=>70, "special_attack"=>115, "defense"=>125, "attack"=>60, "hp"=>70}, {"name"=>"Kabuto", "speed"=>55, "special_defense"=>45, "special_attack"=>55, "defense"=>90, "attack"=>80, "hp"=>30}, {"name"=>"Kabutops", "speed"=>80, "special_defense"=>70, "special_attack"=>65, "defense"=>105, "attack"=>115, "hp"=>60}, {"name"=>"Aerodactyl", "speed"=>130, "special_defense"=>75, "special_attack"=>60, "defense"=>65, "attack"=>105, "hp"=>80}, {"name"=>"Snorlax", "speed"=>30, "special_defense"=>110, "special_attack"=>65, "defense"=>65, "attack"=>110, "hp"=>160}, {"name"=>"Articuno", "speed"=>85, "special_defense"=>125, "special_attack"=>95, "defense"=>100, "attack"=>85, "hp"=>90}, {"name"=>"Zapdos", "speed"=>100, "special_defense"=>90, "special_attack"=>125, "defense"=>85, "attack"=>90, "hp"=>90}, {"name"=>"Moltres", "speed"=>90, "special_defense"=>85, "special_attack"=>125, "defense"=>90, "attack"=>100, "hp"=>90}, {"name"=>"Dratini", "speed"=>50, "special_defense"=>50, "special_attack"=>50, "defense"=>45, "attack"=>64, "hp"=>41}, {"name"=>"Dragonair", "speed"=>70, "special_defense"=>70, "special_attack"=>70, "defense"=>65, "attack"=>84, "hp"=>61}, {"name"=>"Dragonite", "speed"=>80, "special_defense"=>100, "special_attack"=>100, "defense"=>95, "attack"=>134, "hp"=>91}, {"name"=>"Mewtwo", "speed"=>130, "special_defense"=>90, "special_attack"=>154, "defense"=>90, "attack"=>110, "hp"=>106}, {"name"=>"Mew", "speed"=>100, "special_defense"=>100, "special_attack"=>100, "defense"=>100, "attack"=>100, "hp"=>100}]

def create_pokedex
  @pokemon_api.each do |pokedex_hash|
    Pokedex.create(pokedex_hash)
  end
end

def seed_trainer_jackson
  puts "Creating Trainer Jackson..."
  @jackson = Trainer.create(name: "Jackson", email: "jackson@jackson.com", password: "lily", password_confirmation: "lily", age: 24, starter_pokemon: "Charmander", poke_tokens: 20, gender: "Male", last_token: Time.now.to_i)
  @jackson_starter = Pokedex.find_by(name: "Charmander")
  @jackson.pokemons << @jackson_starter.create_pokemon(@jackson)
  @jackson_second_pokemon = Pokedex.find_by(name: "Dratini")
  @jackson.pokemons << @jackson_second_pokemon.create_pokemon(@jackson)
end

def seed_trainer_lily
  puts "Creating Trainer Lily..."
  @lily = Trainer.create(name: "Lily", email: "lily@lily.com", password: "jackson", password_confirmation: "jackson", age: 24, starter_pokemon: "Squirtle", poke_tokens: 20, gender: "Female", last_token: Time.now.to_i)
  @lily_starter = Pokedex.find_by(name: "Squirtle")
  @lily.pokemons << @lily_starter.create_pokemon(@lily)
  @lily_second_pokemon = Pokedex.find_by(name: "Pikachu")
  @lily.pokemons << @lily_second_pokemon.create_pokemon(@lily)
end

create_pokedex
seed_trainer_jackson
seed_trainer_lily
