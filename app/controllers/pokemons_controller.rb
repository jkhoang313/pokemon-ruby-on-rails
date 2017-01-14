class PokemonsController < ApplicationController
  def index
    find_trainer
    @pokemons = @trainer.pokemons
  end

  def show
    find_trainer
    @pokemon = @trainer.pokemons[params[:pokemon_id].to_i-1]
  end

  def destroy
    find_trainer
    @pokemon = Pokemon.find(params[:pokemon_id])
    flash[:message] = "Released #{@pokemon.name} into the wild...."
    @pokemon.destroy

    redirect_to pokemons_path(@trainer)
  end

  def wild
    if current_trainer.poke_tokens < 1
      flash[:message] = "You don't have enough Poketokens."

      redirect_to trainer_path(current_trainer)
    else
      current_trainer.minus_token
      @wild_pokemon = Pokedex.wild_pokemon
    end
  end

  def pokeball
    # if statement for capture works or not
    @captured_pokemon = Pokedex.find(params[:pokedex_id])
    @captured_pokemon.create_pokemon(current_trainer)
    flash[:message] = "You caught a #{@captured_pokemon.name}!"

    redirect_to trainer_path(current_trainer)
  end

  private

  def find_trainer
    @trainer = Trainer.find(params[:id])
  end
end
