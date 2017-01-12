class Pokedex < ApplicationRecord
  has_many :pokemons
  has_many :trainers, through: :pokemons

  def create_pokemon(trainer_id)
    Pokemon.create(trainer_id: trainer_id, pokedex_id: id, name: name, level: level, hp: hp, attack: attack, defense: defense, special_attack: special_attack, special_defense: special_defense, speed: speed)
  end
end
