class Trainer < ApplicationRecord
  has_many :pokemons
  belongs_to :leading_pokemon, class_name: "Pokemon", optional: true
  belongs_to :training_pokemon, class_name: "Pokemon", optional: true
  has_many :gyms, :foreign_key => "gym_leader_id"
  has_many :challenged_gyms, :foreign_key => "challenger_id"
  has_secure_password
  # validates :password, length: { minimum: 4 }
  validates :name, :age, :gender, :leading_pokemon_id, presence: true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  def capitalize_name
    self.name = self.name.downcase.split.collect(&:capitalize).join(' ') if !self.name.blank?
  end

  def create_conditions(starter)
    self.set_token_time
    self.capitalize_name
    self.email.downcase
    @first_pokemon = starter.create_pokemon(self)
    self.leading_pokemon = @first_pokemon

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

  def training_time_left
    time_format(self.training_start + 7200 - current_time)
  end

  def claim_token
    self.update(poke_tokens: self.poke_tokens+1)
    set_token_time
  end

  def minus_token(number)
    self.update(poke_tokens: self.poke_tokens-number)
  end

  def starters
    self.pokemons.where(group: "starters").order(:id)
  end

  def storage
    self.pokemons.where(group: "storage").order(:id)
  end

  def set_token_time
    self.last_token = Time.now.to_i
    self.save
  end

  def self.search(keyword)
    # self.where('name ILIKE ? OR email ILIKE ?', "%#{keyword}%","%#{keyword}%").order(:id)
    self.where('name ILIKE ?', "%#{keyword}%").order(:id)
  end
end
