class Type < ApplicationRecord
  has_many :pokedex_types
  has_many :pokedex, through: :pokedex_types
  has_many :type_weaknesses
  has_many :weaknesses, through: :type_weaknesses
  has_many :type_strengths
  has_many :strengths, through: :type_strengths
end
