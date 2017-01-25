class Gym < ApplicationRecord
  belongs_to :gym_leader, class_name: "Trainer"
  belongs_to :gym_pokemon, class_name: "Pokemon"
  belongs_to :challenger, class_name: "Trainer", optional: true
  belongs_to :challenger_pokemon, class_name: "Pokemon", optional: true
  belongs_to :winner, class_name: "Pokemon", optional: true
  has_many :challenges

  def status
    self.challenged? ? "Currently being challenged" : "Open to Challengers"
  end

  def current_streak
    total_time = current_time - self.last_taken
    time_format(total_time)
  end

  def challenged?
    self.challenger_id && self.challenger_pokemon_id
  end

  def stat_boost(value, pokemon)
    " + #{(value.to_i*0.2).floor}" if pokemon.types.pluck(:name).include?(self.specialty)
  end

  def gym_time_left(kind)
    if kind == "Challenge"
      time_left = self.challenge_time + 7200 - current_time

      time_format(time_left)
    elsif kind == "Grace"
      time_left = self.challenge_time + 10800 - current_time
      time_format(time_left)
    end
  end

  def challenge_over?
    # self.challenge_time + 7200 < current_time
    self.challenge_time + 10 < current_time
  end

  def grace_over?
    # self.challenge_time + 10800 < current_time
    self.challenge_time + 20 < current_time
  end

  def challenger_percentage_win
    c = attacker_totals(challenger_pokemon, gym_pokemon)
    g = attacker_totals(gym_pokemon, challenger_pokemon)

    c/(c+g).to_f
  end

  def find_winner
    if !self.winner
      if rand > challenger_percentage_win
        self.update(winner_id: self.gym_pokemon_id)
        Challenge.create(gym_id: self.id, gym_leader: gym_leader.name, gym_pokemon: gym_pokemon.name, challenger: challenger.name, challenger_pokemon: challenger_pokemon.name, winner: "Gym Leader")
      else
        self.update(winner_id: self.challenger_pokemon_id)
        Challenge.create(gym_id: self.id, gym_leader: gym_leader.name, gym_pokemon: gym_pokemon.name, challenger: challenger.name, challenger_pokemon: challenger_pokemon.name, winner: "Challenger")
      end
    end
  end

  def attacker_totals(attacker, defender)
    effective = 2**attacker.strengths.where(id: defender.types.pluck(:id)).count

    not_effective = 2**attacker.weaknesses.where(id: defender.types.pluck(:id)).count

    multiplier = effective.to_f / not_effective.to_f
    multiplier * attacker.total_stats(self.specialty).to_f
  end

  def gym_results
    find_winner
    if winner_id == challenger_pokemon_id
      self.gym_pokemon.update(occupied: false)
      self.update(gym_leader_id: challenger_id, gym_pokemon_id: challenger_pokemon_id, last_taken: (self.challenge_time + 10800))
    else
      self.challenger_pokemon.update(occupied: false)
    end
    self.update(challenger_id: nil, challenger_pokemon_id: nil, winner_id: nil, challenge_time: nil)
  end
end
