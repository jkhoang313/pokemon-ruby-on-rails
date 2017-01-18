class Pokemon < ApplicationRecord
  belongs_to :trainer
  belongs_to :pokedex
  # has_many :pokedex_types, :foreign_key => "pokedex_id"
  has_many :types, through: :pokedex
end
