class Trainer < ApplicationRecord
  has_many :pokemons
  has_secure_password
  validates :name, :age, :starter_pokemon, :gender, presence: true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  # make starter with sprite on search

  def capitalize_name
    self.name = self.name.downcase.split.collect(&:capitalize).join(' ') if !self.name.blank?
  end

  def create_conditions(starter)
    self.set_token_time
    self.capitalize_name
    self.email.downcase
    starter.create_pokemon(self)
    self.save
  end

  def token_time_passed?
    next_token = last_token + 14400
    next_token < current_time
  end

  def token_status
    if token_time_passed?
      "Available upon login"
    else
      total_seconds = last_token + 14400 - current_time
      hours_left = total_seconds / 3600
      seconds = total_seconds % 3600

      minutes_left = seconds / 60
      seconds_left = seconds % 60
      "#{hours_left} Hour(s) #{minutes_left} Minute(s) #{seconds_left} Second(s)"
    end
  end

  def claim_token
    self.update(poke_tokens: self.poke_tokens+1)
    set_token_time
  end

  def minus_token
    self.update(poke_tokens: self.poke_tokens-1)
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
  #make method for moving starters and storage pokemon
  #add search bar
end
