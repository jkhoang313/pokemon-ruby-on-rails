class WildPokemonController < ApplicationController
  def wild
    # if current_trainer.poke_tokens < 1
    #   # take out cost to look for pokemon?
    #
    #   redirect_to trainer_path(current_trainer)
    # else
      # current_trainer.minus_token(1)
      @wild_pokemon = WildPokemon.wild_pokemon
      #change to finding instance instead of name
    # end
  end

  def pokeball
    @chance = rand(1..11)
    @wild_pokemon = Pokedex.find(params[:pokedex_id])

    capture_pokemon(@chance, "Pokeball", 1)
  end

  def great_ball
    @chance = rand(3..13)
    @wild_pokemon = Pokedex.find(params[:pokedex_id])

    capture_pokemon(@chance, "Great Ball", 2)
  end

  def ultra_ball
    @chance = rand(5..15)
    @wild_pokemon = Pokedex.find(params[:pokedex_id])

    capture_pokemon(@chance, "Ultra Ball", 3)
  end

  private

  def capture_pokemon(chance, ball, tokens)
    if current_trainer.poke_tokens < tokens
      flash[:message] = "You don't have enough poke-tokens"
      @wild_pokemon = @wild_pokemon.name

      render :'wild_pokemon/wild'
      flash.clear
    else
      current_trainer.minus_token(tokens)
      if @chance <= 5
        flash[:message] = "Threw a(n) #{ball}. Wild #{@wild_pokemon.name} ran away!"
        @wild_pokemon = @wild_pokemon.name

        redirect_to trainer_path(current_trainer)
      elsif @chance <= 7
        flash[:message] = "Threw a(n) #{ball} but the wild #{@wild_pokemon.name} broke free!"
        @wild_pokemon = @wild_pokemon.name

        render :'wild_pokemon/wild'
        flash.clear
      else
        @wild_pokemon.create_pokemon(current_trainer)
        flash[:message] = "Threw a(n) #{ball}.You caught a(n) #{@wild_pokemon.name}!"
        @pokemon_count = current_trainer.pokemons.count

        redirect_to pokemon_path(current_trainer, @pokemon_count)
      end
    end
  end
end
