class Pokedex < ApplicationRecord
  has_many :pokemons
  has_many :trainers, through: :pokemons
  has_many :pokedex_types
  has_many :types, through: :pokedex_types

  def create_pokemon(trainer)
    @pokemon = Pokemon.create(trainer_id: trainer, pokedex_id: id, name: name, level: level, hp: randomize_stat(hp), attack: randomize_stat(attack), defense: randomize_stat(defense), special_attack: randomize_stat(special_attack), special_defense: randomize_stat(special_defense), speed: randomize_stat(speed))

    trainer.pokemons << @pokemon
    @pokemon
  end

  def self.starter_pokemon(choice)
    if choice == "Random"
      Pokedex.find_by(name: self.random_starter)
    else
      Pokedex.find_by(name: choice)
    end
  end

  def self.random_starter
    common = ["Caterpie", "Weedle", "Pidgey", "Rattata", "Spearow", "Zubat", "Tentacool", "Geodude", "Magikarp"]
    rare = ["Ekans", "Sandshrew", "Nidoran-f", "Nidoran-m", "Oddish", "Paras", "Venonat", "Diglett", "Meowth", "Mankey", "Abra", "Machop", "Bellsprout", "Magnemite", "Doduo", "Grimer", "Shellder", "Voltorb", "Koffing", "Tangela", "Horsea", "Goldeen", "Staryu"]
    super_rare = ["Pikachu", "Clefairy", "Vulpix", "Jigglypuff", "Psyduck", "Growlithe", "Poliwag", "Ponyta", "Slowpoke", "Farfetchd", "Seel", "Gastly", "Onix", "Drowzee", "Krabby", "Exeggcute", "Cubone", "Rhyhorn", "Chansey", "Tauros", "Ditto", "Eevee"]
    ultra_rare = ["Pinsir", "Lickitung", "Hitmonlee", "Hitmonchan", "Kangaskhan", "Lapras", "Mr-mime", "Scyther", "Jinx", "Electabuzz", "Magmar", "Porygon", "Omanyte", "Kabuto", "Aerodactyl", "Snorlax", "Dratini"]
    #make better percentages

    random_number = rand(1..100)

    if random_number < 40
      common.sample
    elsif random_number < 70
      rare.sample
    elsif random_number < 90
      super_rare.sample
    else
      ultra_rare.sample
    end
  end

  def self.wild
    roster = ["Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon", "Charizard", "Squirtle", "Wartortle", "Blastoise", "Caterpie", "Metapod", "Butterfree", "Weedle", "Kakuna", "Beedrill", "Pidgey", "Pidgeotto", "Pidgeot", "Rattata", "Raticate", "Spearow", "Fearow", "Ekans", "Arbok", "Pikachu", "Raichu", "Sandshrew", "Sandslash", "Nidoran-f", "Nidorina", "Nidoqueen", "Nidoran-m", "Nidorino", "Nidoking", "Clefairy", "Clefable", "Vulpix", "Ninetales", "Jigglypuff", "Wigglytuff", "Zubat", "Golbat", "Oddish", "Gloom", "Vileplume", "Paras", "Parasect", "Venonat", "Venomoth", "Diglett", "Dugtrio", "Meowth", "Persian", "Psyduck", "Golduck", "Mankey", "Primeape", "Growlithe", "Arcanine", "Poliwag", "Poliwhirl", "Poliwrath", "Abra", "Kadabra", "Alakazam", "Machop", "Machoke", "Machamp", "Bellsprout", "Weepinbell", "Victreebel", "Tentacool", "Tentacruel", "Geodude", "Graveler", "Golem", "Ponyta", "Rapidash", "Slowpoke", "Slowbro", "Magnemite", "Magneton", "Farfetchd", "Doduo", "Dodrio", "Seel", "Dewgong", "Grimer", "Muk", "Shellder", "Cloyster", "Gastly", "Haunter", "Gengar", "Onix", "Drowzee", "Hypno", "Krabby", "Kingler", "Voltorb", "Electrode", "Exeggcute", "Exeggutor", "Cubone", "Marowak", "Hitmonlee", "Hitmonchan", "Lickitung", "Koffing", "Weezing", "Rhyhorn", "Rhydon", "Chansey", "Tangela", "Kangaskhan", "Horsea", "Seadra", "Goldeen", "Seaking", "Staryu", "Starmie", "Mr-mime", "Scyther", "Jynx", "Electabuzz", "Magmar", "Pinsir", "Tauros", "Magikarp", "Gyarados", "Lapras", "Ditto", "Eevee", "Vaporeon", "Jolteon", "Flareon", "Porygon", "Omanyte", "Omastar", "Kabuto", "Kabutops", "Aerodactyl", "Snorlax", "Articuno", "Zapdos", "Moltres", "Dratini", "Dragonair", "Dragonite", "Mewtwo", "Mew"]
    roster.sample
  end

  private

  def randomize_stat(stat)
    (rand(0.9..1.1) * stat.to_i).to_i.to_s
  end
end
