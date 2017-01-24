class Pokemon < ApplicationRecord
  belongs_to :trainer
  belongs_to :pokedex
  has_many :types, through: :pokedex
  has_one :gym, :foreign_key => "gym_pokemon_id"
  has_one :gym_challenge, :foreign_key => "challenger_pokemon"

  def total_stats
    hp.to_i + attack.to_i + defense.to_i + special_attack.to_i + special_defense.to_i + speed.to_i
  end
end
