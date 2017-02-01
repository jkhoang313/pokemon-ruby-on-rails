class Pokedex < ApplicationRecord
  has_many :pokemons
  has_many :trainers, through: :pokemons
  has_many :pokedex_types
  has_many :types, through: :pokedex_types
  has_many :weaknesses, through: :types
  has_many :strengths, through: :types
  belongs_to :evolution, class_name: "Pokedex", optional: true

  def create_pokemon(trainer)
    group = trainer.starters.count < 6 ? "starters" : "storage"
    @pokemon = Pokemon.create(trainer_id: trainer, pokedex_id: id, name: name, hp: randomize_stat(hp), attack: randomize_stat(attack), defense: randomize_stat(defense), special_attack: randomize_stat(special_attack), special_defense: randomize_stat(special_defense), speed: randomize_stat(speed), group: group, evolution_id: evolution_id)

    @pokemon.update(evolution_id: rand(134..136)) if self.id == 133

    trainer.pokemons << @pokemon
    @pokemon
  end

  def self.wild
    common = ["Caterpie", "Weedle", "Pidgey", "Rattata", "Spearow", "Ekans", "Magikarp", "Geodude", "Tentacool"]
    rare = ["Ditto", "Hitmonlee", "Hitmonchan", "Onix", "Tangela", "Chansey", "Horsea", "Goldeen", "Staryu", "Pikachu", "Sandshrew", "Nidoran-f", "Nidoran-m", "Clefairy", "Vulpix", "Jigglypuff", "Zubat", "Oddish", "Paras", "Venonat", "Diglett", "Meowth", "Psyduck", "Mankey", "Growlithe", "Poliwag", "Abra", "Machop", "Bellsprout",   "Ponyta", "Slowpoke", "Magnemite", "Farfetchd", "Doduo", "Seel", "Grimer", "Shellder", "Gastly",  "Drowzee", "Krabby", "Voltorb", "Exeggcute", "Cubone",  "Lickitung", "Koffing", "Porygon", "Omanyte", "Kabuto"]
    super_rare = ["Dratini", "Mr-mime", "Scyther", "Jynx", "Electabuzz", "Magmar", "Pinsir", "Aerodactyl", "Snorlax", "Tauros", "Lapras", "Kangaskhan", "Eevee", "Rhyhorn"]
    ultra_rare = ["Articuno", "Zapdos", "Moltres", "Mewtwo", "Mew"]

    random_number = rand(1..1000)

    if random_number < 500
      common.sample
    elsif random_number < 950
      rare.sample
    elsif random_number < 999
      super_rare.sample
    else
      ultra_rare.sample
    end
  end

  def fixed_weakness
    self.weaknesses.where.not(id: self.strengths.pluck(:id)).uniq
  end

  def fixed_strength
    self.strengths.where.not(id: self.weaknesses.pluck(:id)).uniq
  end

  private

  def randomize_stat(stat)
    (rand(0.9..1.1) * stat.to_i).to_i.to_s
  end
end
