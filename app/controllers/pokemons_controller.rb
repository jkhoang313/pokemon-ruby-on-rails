class PokemonsController < ApplicationController
  def index
    find_trainer
    @pokemons = @trainer.pokemons
    # before action for these 2 settings?
    # add release pokemon option
  end

  def show
    #if else statement for incorrect routes
    find_trainer
    @pokemon = @trainer.pokemons[params[:pokemon_id].to_i-1]
  end

  def destroy
    find_trainer
    @pokemon = @trainer.pokemons[params[:pokemon_id].to_i-1]
    @pokemon.destroy
    #you could hack around this by changing the html

    redirect_to pokemons_path(@trainer)
  end

  private

  def find_trainer
    @trainer = Trainer.find(params[:id])
  end
end
