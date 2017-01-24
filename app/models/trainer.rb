class Trainer < ApplicationRecord
  has_many :pokemons
  has_many :gyms, :foreign_key => "gym_leader_id"
  has_many :challenged_gyms, :foreign_key => "challenger_id"
  has_secure_password
  validates :name, :age, :starter_pokemon, :gender, presence: true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  def capitalize_name
    self.name = self.name.downcase.split.collect(&:capitalize).join(' ') if !self.name.blank?
  end

  def create_conditions(starter)
    self.set_token_time
    self.capitalize_name
    self.email.downcase
    @first_pokemon = starter.create_pokemon(self)
    self.starter_pokemon = @first_pokemon.name

    self.save
  end

  def token_time_passed?
    last_token + 7200 < current_time
  end

  def token_status
    if token_time_passed?
      "Available"
    else
      time_left = last_token + 7200 - current_time

      time_format(time_left)
    end
  end

  def claim_token
    self.update(poke_tokens: self.poke_tokens+1)
    set_token_time
  end

  def minus_token(number)
    self.update(poke_tokens: self.poke_tokens-number)
  end

  def starters
    self.pokemons[0..5]
  end

  def storage
    self.pokemons[6..-1]
  end

  def set_token_time
    self.last_token = Time.now.to_i
    self.save
  end
end
