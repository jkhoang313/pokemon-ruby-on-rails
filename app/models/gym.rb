class Gym < ApplicationRecord
  belongs_to :gym_leader, class_name: "Trainer"
  belongs_to :gym_pokemon, class_name: "Pokemon"
  belongs_to :challenger, class_name: "Trainer", optional: true
  belongs_to :challenger_pokemon, class_name: "Pokemon", optional: true
  belongs_to :winner, class_name: "Pokemon", optional: true
  # add training tab in nav

  def status
    self.challenged? ? "Currently being challenged" : "Open to Challengers"
  end

  def current_streak
    total_seconds = current_time - self.last_taken

    days_left = total_seconds / 86400
    total_seconds = total_seconds % 86400

    hours_left = total_seconds / 3600
    seconds = total_seconds % 3600

    minutes_left = seconds / 60
    seconds_left = seconds % 60
    "#{days_left} Day(s) #{hours_left} Hour(s) #{minutes_left} Minute(s) #{seconds_left} Second(s)"
  end

  def challenged?
    self.challenger_id && self.challenger_pokemon_id
  end

  def stat_boost(value)
    " + #{(value.to_i*0.2).floor}" if self.gym_pokemon.types.pluck(:name).include?(self.specialty)
    # add stat boost for all pokemon? including challenger
    # add stat boost for being gym leader?
  end

  def time_format(period)
    if period == "challenge"
      time_left = self.challenge_time + 7200 - current_time
    elsif period == "grace"
      time_left = self.challenge_time + 7200 - current_time
    end

    hours_left = time_left / 3600
    seconds = time_left % 3600

    minutes_left = seconds / 60
    seconds_left = seconds % 60

    "#{hours_left} Hour(s) #{minutes_left} Minute(s) #{seconds_left} Second(s) left"
  end

  def challenge_over?
    # self.challenge_time + 7200 < current_time
    self.challenge_time + 10 < current_time
  end

  def grace_over?
    # self.challenge_time + 14400 < current_time
    self.challenge_time + 20 < current_time
    ## add previous results
  end

  def find_winner
    if !self.winner
      c = challenger_pokemon.total_stats
      g = gym_pokemon.total_stats
      c_chance = c/(c+g).to_f
      if rand > c_chance
        self.update(winner_id: self.gym_pokemon_id)
      else
        self.update(winner_id: self.challenger_pokemon_id)
      end
    end
  end

  def gym_results
    find_winner
    if winner_id == challenger_pokemon_id
      self.gym_pokemon.update(occupied: false)
      self.update(gym_leader_id: challenger_id, gym_pokemon_id: challenger_pokemon_id, last_taken: (self.challenge_time + 14400))
    else
      self.challenger_pokemon.update(occupied: false)
    end
    self.update(challenger_id: nil, challenger_pokemon_id: nil, winner_id: nil, challenge_time: nil)
  end
end
