class WildPokemonController < ApplicationController
  def wild
    @wild_pokemon = Pokedex.wild
    #for some reason, this lists 2nd last pokemon when you click button while on page
  end

  def pokeball
    @chance = rand(1..11)
    find_wild_pokemon

    capture_pokemon(@chance, "Pokeball", 1)
  end

  def great_ball
    @chance = rand(3..13)
    find_wild_pokemon

    capture_pokemon(@chance, "Great Ball", 2)
  end

  def ultra_ball
    @chance = rand(5..15)
    find_wild_pokemon

    capture_pokemon(@chance, "Ultra Ball", 3)
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
      if @chance <= 5
        flash[:message] = "Threw a(n) #{ball}. Wild #{@wild_pokemon.name} ran away!"

        redirect_to trainer_path(current_trainer)
      elsif @chance <= 7
        flash[:message] = "Threw a(n) #{ball} but the wild #{@wild_pokemon.name} broke free!"
        @wild_pokemon = @wild_pokemon.name

        render :'wild_pokemon/wild'
        flash.clear
      else
        flash[:message] = "Threw a(n) #{ball}.You caught a(n) #{@wild_pokemon.name}!"
        @wild_pokemon.create_pokemon(current_trainer)
        @pokemon_count = current_trainer.pokemons.count

        redirect_to pokemon_path(current_trainer, @pokemon_count)
      end
    end
  end
end
