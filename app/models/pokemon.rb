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
    self.created_at.strftime('%B %d, %Y %_I:%M %p %Z')
  end

  def fixed_weakness
    self.weaknesses.where.not(id: self.strengths.pluck(:id)).uniq
  end

  def fixed_strength
    self.strengths.where.not(id: self.weaknesses.pluck(:id)).uniq
  end

  def status
    if self == self.trainer.training_pokemon
      "Physical Training"
    elsif self == self.trainer.contest_pokemon
      "Pokemon Contest"
    elsif self == self.trainer.daycare_pokemon
      "Daycare"
    end
  end

  def action(kind)
    if kind == 'train'
      stat_one = 'attack'
      new_stat_one = self.attack * 1.05
      stat_two = 'defense'
      new_stat_two = self.defense * 1.05
    elsif kind == 'contest'
      stat_one = 'special_attack'
      new_stat_one = self.special_attack * 1.05
      stat_two = 'special_defense'
      new_stat_two = self.special_defense * 1.05
    elsif kind == 'daycare'
      stat_one = 'hp'
      new_stat_one = self.hp * 1.05
      stat_two =  'speed'
      new_stat_two = self.speed * 1.05
    end
    self.update(occupied: false, stat_one => new_stat_one, stat_two => new_stat_two)
    "#{self.name} gained #{(self[stat_one]*0.05).floor} #{stat_one.gsub("_", " ").gsub(/\S+/, &:capitalize)} and #{(self[stat_two]*0.05).floor} #{stat_two.gsub("_", " ")}."
  end
end
