class Pokedex < ApplicationRecord
  has_many :pokemons
  has_many :trainers, through: :pokemons
  has_many :pokedex_types
  has_many :types, through: :pokedex_types

  def create_pokemon(trainer)
    @pokemon = Pokemon.create(trainer_id: trainer, pokedex_id: id, name: name, level: level, hp: hp, attack: attack, defense: defense, special_attack: special_attack, special_defense: special_defense, speed: speed)

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
end
