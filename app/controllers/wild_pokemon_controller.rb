class WildPokemonController < ApplicationController
  def wild
    @wild = Pokedex.wild
    @wild_pokemon = @wild[0]
    @rarity = @wild[1]
    session[:r] = @rarity
    session[:wp] = @wild_pokemon
    @captured = current_trainer.pokemons.where(name: @wild_pokemon).count > 0
  end

  def pokeball
    @chance = rand(1..100)
    @wild_pokemon = Pokedex.find_by(name: session[:wp])

    capture_pokemon(@chance, "Pokeball", 1)
  end

  def great_ball
    @chance = rand(1..80)
    @wild_pokemon = Pokedex.find_by(name: session[:wp])

    capture_pokemon(@chance, "Great Ball", 2)
  end

  def ultra_ball
    @chance = rand(1..60)
    @wild_pokemon = Pokedex.find_by(name: session[:wp])

    capture_pokemon(@chance, "Ultra Ball", 3)
  end

  def master_ball
    @chance = 1
    @wild_pokemon = Pokedex.find_by(name: session[:wp])

    capture_pokemon(@chance, "Master Ball", 7)
  end

  def captured
    @pokemon_pos = params[:pokemon_id]
  end

  private

  def find_wild_pokemon
    @wild_pokemon = Pokedex.find_by(name: params[:pokemon_name])
  end

  def capture_pokemon(chance, ball, tokens)
    if current_trainer.poke_tokens < tokens
      flash[:message] = "You don't have enough poke-tokens"
      @wild_pokemon = @wild_pokemon.name

      render :'wild_pokemon/wild'
      flash.clear
    else
      current_trainer.minus_token(tokens)
      if @chance <= 40
        flash[:message] = "Threw a(n) #{ball}.You caught a(n) #{@wild_pokemon.name}!"
        @wild_pokemon.create_pokemon(current_trainer)
        @pokemon_count = current_trainer.pokemons.count

        render :'wild_pokemon/captured'
        session[:wp] = nil
        flash.clear
      elsif @chance <= 50 || @chance % 2 == 0
        flash[:message] = "Threw a(n) #{ball} but the wild #{@wild_pokemon.name} broke free!"
        @wild_pokemon = @wild_pokemon.name
        @captured = current_trainer.pokemons.where(name: @wild_pokemon).count > 0
        @rarity = session[:r]

        render :'wild_pokemon/wild'
        flash.clear
      else
        flash[:message] = "Threw a(n) #{ball}. Wild #{@wild_pokemon.name} ran away!"
        session[:wp] = nil

        redirect_to trainer_path(current_trainer)
      end
    end
  end
end
