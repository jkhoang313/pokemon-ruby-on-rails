class WildPokemonController < ApplicationController
  def wild
    if current_trainer.poke_tokens < 1
      flash[:message] = "You don't have enough Poketokens"

      redirect_to trainer_path(current_trainer)
    else
      current_trainer.minus_token(1)
      @wild_pokemon = Pokedex.wild_pokemon
    end
  end

  def pokeball
    # if statement for capture works or not
    @chance = rand(1..10)
    @wild_pokemon = Pokedex.find(params[:pokedex_id])
    current_trainer.minus_token(1)
    @tokens_spent = 1
    # add recapture chance
    capture_pokemon(@chance, "Pokeball")
  end

  def great_ball
    @chance = rand(3..13)
    @wild_pokemon = Pokedex.find(params[:pokedex_id])
    current_trainer.minus_token(2)
    @tokens_spent = 2

    capture_pokemon(@chance, "Great Ball")
  end

  def ultra_ball
    @chance = rand(5..15)
    @wild_pokemon = Pokedex.find(params[:pokedex_id])
    current_trainer.minus_token(3)
    @tokens_spent = 3

    capture_pokemon(@chance, "Ultra Ball")
  end

  private

  def capture_pokemon(chance, ball)
    if chance <= 6
      flash[:message] = "Threw a(n) #{ball}. Wild #{@wild_pokemon.name} ran away!"
      redirect_to trainer_path(current_trainer)
    else
      @wild_pokemon.create_pokemon(current_trainer)
      flash[:message] = "Threw a(n) #{ball}.You caught a(n) #{@wild_pokemon.name}!"
      @pokemon_count = current_trainer.pokemons.count
      # change url method?
      redirect_to pokemon_path(current_trainer, @pokemon_count)
    end
  end
end
