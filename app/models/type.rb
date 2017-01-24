class Type < ApplicationRecord
  has_many :pokedex_types
  has_many :pokedex, through: :pokedex_types
  #add weaknesses table
end
