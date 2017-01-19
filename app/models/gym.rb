class Gym < ApplicationRecord
  belongs_to :gym_leader, class_name: "Trainer"
  belongs_to :gym_pokemon, class_name: "Pokemon"
end
