class Trainer < ApplicationRecord
  has_many :pokemons
  before_save :capitalize_name, :set_token
  has_secure_password
  validates :name, presence: true, uniqueness: true

  def capitalize_name
    self.name = self.name.downcase.split.collect(&:capitalize).join(' ') if self.name && !self.name.blank?
  end

  def self.random_starter
    common = ["Caterpie", "Weedle", "Pidgey", "Rattata", "Spearow", "Zubat", "Tentacool", "Geodude", "Magikarp"]
    rare = ["Ekans", "Sandshrew", "Nidoran-f", "Nidoran-m", "Oddish", "Paras", "Venonat", "Diglett", "Meowth", "Mankey", "Abra", "Machop", "Bellsprout", "Magnemite", "Doduo", "Grimer", "Shellder", "Voltorb", "Koffing", "Tangela", "Horsea", "Goldeen", "Staryu"]
    super_rare = ["Pikachu", "Clefairy", "Vulpix", "Jigglypuff", "Psyduck", "Growlithe", "Poliwag", "Ponyta", "Slowpoke", "Farfetchd", "Seel", "Gastly", "Onix", "Drowsee", "Krabby", "Exeggcute", "Cubone", "Rhyhorn", "Chansey", "Tauros", "Ditto", "Eevee"]
    ultra_rare = ["Pinsir", "Lickitung", "Hitmonlee", "Hitmonchan", "Kangaskhan", "Lapras", "Mr-mime", "Scyther", "Jinx", "Electabuzz", "Magmar", "Porygon", "Omanyte", "Kabuto", "Qerodactyl", "Snorlax", "Dratini"]
    #make better percentages

    random_number = rand(1..100)

    if random_number < 40
      common.sample
    elsif random_number < 70
      rare.sample
    elsif random_number < 90
      super_rare.sample
    else
      ultra_rare.sample
    end
  end

  def token_time_passed?
    time_passed = last_token + 14400

    time_passed - Time.now.to_i > 0 ? false : true
  end

  def token_status
    if token_time_passed?
      "Available upon login"
    else
      total_seconds = last_token + 14400 - Time.now.to_i
      hours_left = total_seconds / 3600
      seconds_left = total_seconds % 3600

      minutes_left = seconds_left / 60
      final_seconds = seconds_left % 60
      "#{hours_left} Hour(s) #{minutes_left} Minute(s) #{final_seconds} Second(s)"
    end
  end

  def add_token
    @new_token = self.poke_tokens + 1
    self.update(poke_tokens: @new_token, last_token: Time.now.to_i)
  end

  def starters
    self.pokemons[0..5]
  end

  def storage
    self.pokemons[6..-1]
  end

  def set_token
    self.last_token = Time.now.to_i
  end
  #make method for moving starters and storage pokemon
end
