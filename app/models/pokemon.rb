class Pokemon < ApplicationRecord
  belongs_to :trainer
  belongs_to :pokedex
  has_many :types, through: :pokedex
  has_one :gym, :foreign_key => "gym_pokemon_id"
  has_one :gym_challenge, :foreign_key => "challenger_pokemon"
  has_many :weaknesses, through: :types
  has_many :strengths, through: :types

  def total_stats(gym_type)
    if self.types.pluck(:name).include?(gym_type)
      @multipler = 1.2
    else
      @multipler = 1
    end
    @multipler * (hp.to_i + attack.to_i + defense.to_i + special_attack.to_i + special_defense.to_i + speed.to_i)
  end

  def found_on
    self.created_at.strftime('%B %d, %Y %I:%M %p')
  end

  def fixed_weakness
    self.weaknesses.where.not(id: self.strengths.pluck(:id)).uniq
  end

  def fixed_strength
    self.strengths.where.not(id: self.weaknesses.pluck(:id)).uniq
  end
end
