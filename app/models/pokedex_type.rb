class PokedexType < ApplicationRecord
  belongs_to :type
  belongs_to :pokedex
end
