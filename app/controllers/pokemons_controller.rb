class PokemonsController < ApplicationController
  def index
    find_trainer
    @pokemons = @trainer.pokemons
  end

  def show
    find_trainer
    @index = params[:pokemon_id]
    @pokemon = @trainer.pokemons[params[:pokemon_id].to_i-1]
  end

  def destroy
    find_trainer
    if @trainer.pokemons.count == 1
      @index = params[:pokemon_id]
      flash[:message] = "You can't release your last Pokemon!"

      redirect_to pokemon_path(@trainer, @index)
    else
      @pokemon = @trainer.pokemons[params[:pokemon_id].to_i-1]
      flash[:message] = "Released #{@pokemon.name} into the wild...."
      @pokemon.destroy

      redirect_to pokemons_path(@trainer)
    end
  end
end
