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
    #can't release last pokemon

    redirect_to pokemons_path(@trainer)
  end
end
