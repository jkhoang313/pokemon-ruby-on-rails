class Gym < ApplicationRecord
  belongs_to :gym_leader, class_name: "Trainer"
  belongs_to :gym_pokemon, class_name: "Pokemon"
  # add training tab in nav

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
    self.challenger_id && self.challenger_pokemon
  end

  def stat_boost(value)
    " + #{(value.to_i*0.2).floor}" if self.gym_pokemon.types.pluck(:name).include?(self.specialty)
    # add stat boost for all pokemon? including challenger
    # add stat boost for being gym leader?
  end
end
